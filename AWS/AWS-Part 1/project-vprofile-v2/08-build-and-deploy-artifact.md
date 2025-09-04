<!-- 08-build-and-deploy-artifact.md -->
# 08 — Build & Deploy del artefacto

> **Resumen**  
> Compilé el **`.war`** con Maven y lo subí a **Elastic Beanstalk**. Antes actualicé **`application.properties`** con los endpoints y puertos correctos de **RDS**, **ElastiCache** y **Amazon MQ** (TLS).

## Configuración de `application.properties`
~~~properties
# Base de datos
jdbc.url=jdbc:mysql://<rds-endpoint>:3306/accounts
jdbc.username=admin
jdbc.password=<PASSWORD_SEGURA>

# Memcached
memcached.servers=<elasticache-config-endpoint>:11211

# RabbitMQ (AMQPS/TLS)
rabbit.host=<amazon-mq-amqps-endpoint>
rabbit.port=5671
rabbit.username=rabbit
rabbit.password=<PASSWORD_SEGURA>
~~~

## Build del artefacto
~~~bash
mvn -v                # Verifico versión (3.9.x recomendada)
mvn clean package -DskipTests
# Artefacto resultante:
# target/vprofile-v2.war
~~~

## Despliegue en Elastic Beanstalk
1. **Upload and Deploy** del `.war` desde la consola (o `eb deploy` por CLI).
2. Política: **Rolling** (en laboratorio uso batch 50%: actualiza una instancia y luego la otra).
3. Verifico **Eventos** del entorno y el **Target Health** en el **ALB**.

## HTTPS y dominio (opcional recomendado)
- Solicito/uso **certificado ACM** válido.
- Listener **443** en el ALB; redirijo **80 → 443** si quiero forzar HTTPS.
- Si tengo dominio (Route 53/registrador), creo **CNAME → DNS del ALB/EB**.

## Validación funcional
- Login **`admin_vp / admin_vp`**.
- Operaciones que tocan **DB** y **caché** (lectura/escritura) OK.
- Si la sesión “salta”, reviso **Sticky Sessions** en el Target Group.

## Problemas comunes y soluciones
- **`java.lang.*` al arrancar**: revisar versión de JDK/Tomcat de la plataforma EB.
- **Conexión a MQ falla**: asegurar **`5671`** (TLS) y endpoint **AMQPS**.
- **DB no accesible**: comprobar regla `3306` de **origen = SG de EB** (no abrir a 0.0.0.0/0).

## Checklist de cierre
- [x] `.war` compilado y desplegado.  
- [x] `application.properties` con endpoints/puertos correctos.  
- [x] HTTPS operativo (si aplica).  
- [x] Pruebas de funcionalidad (login + DB + caché) superadas.
