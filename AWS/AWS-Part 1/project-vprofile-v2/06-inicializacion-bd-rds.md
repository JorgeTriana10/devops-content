<!-- 06-inicializacion-bd-rds.md -->
# 06 — Inicialización de la base de datos (RDS)

> **Resumen**  
> Como mi instancia de **RDS MySQL** es **privada** (sin acceso público), levanté una **EC2 temporal** en la misma VPC para conectarme como cliente MySQL, cargar el **dump SQL** y validar conectividad end-to-end. Después, eliminé esa EC2 para no dejar costes residuales.

## Flujo de trabajo (paso a paso)
1. **Creo EC2 utilitaria** (Ubuntu `t2.micro`) con un **Security Group propio** que solo permite **SSH (22)** desde mi IP.
2. En **`vprofile-backend-sg`** (el SG del backend) **añado inbound MySQL (3306)** con **origen = SG de la EC2 utilitaria**. Así, esa EC2 puede llegar a RDS sin abrir Internet.
3. Instalo herramientas en la EC2:
   ~~~bash
   sudo apt update
   sudo apt install -y mysql-client git
   ~~~
4. Clono el repositorio del proyecto y localizo el **`db_backup.sql`** (dump de la app).
5. Me conecto a **RDS** y cargo el esquema:
   ~~~bash
   # Conexión interactiva (pide contraseña sin exponerla en CLI)
   mysql -h <rds-endpoint> -u admin -p

   # Dentro de MySQL
   USE accounts;
   SOURCE /ruta/a/db_backup.sql;
   ~~~
   Alternativa no interactiva (si ya tengo la contraseña segura en una variable/gestor):
   ~~~bash
   mysql -h <rds-endpoint> -u admin -p < /ruta/a/db_backup.sql
   ~~~
6. Valido con consultas rápidas:
   ~~~sql
   SHOW TABLES;
   SELECT COUNT(*) FROM <tabla_clave>;
   ~~~
7. Quito la **regla temporal** del SG si ya no la necesito y **termino** la EC2 utilitaria.

## Diagrama (flujo de inicialización)
~~~mermaid
flowchart LR
  Dev[ (SSH)] --> EC2[EC2 utilitaria]
  EC2 -->|3306| RDS[(RDS MySQL privada)]
  RDS -->|OK| EC2
  EC2 -.cleanup.-> X[(Eliminar EC2)]
~~~

## Buenas prácticas que apliqué
- **No** paso la contraseña tras `-p` (evito `-pPASSWORD` para que no quede en el historial).
- Mantengo **RDS sin acceso público** y solo permito 3306 **desde SGs concretos**.
- Credenciales guardadas en **Secrets/variables** (nunca en el repositorio).
- Si el dump trae errores de encoding, reviso en el **Parameter Group** `character_set_server` y `collation_server`.

## Troubleshooting rápido
- **Conectividad**: desde la EC2 utilitaria pruebo `nc -vz <rds-endpoint> 3306`. Si falla, revisar **SG** y **subred**.
- **Access denied**: comprobar usuario, contraseña y **host permitido** para ese usuario.
- **Latency/timeouts**: revisar NACLs, rutas de la VPC y que la EC2 esté en subred con salida.

## Checklist de cierre
- [x] Dump restaurad
