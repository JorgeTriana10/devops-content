<!-- 04-elasticache-memcached.md -->
# 04 — ElastiCache (Memcached)

> [!SUMMARY]
> Migré la capa de caché a **ElastiCache (Memcached)** para quitar mantenimiento de servidores y obtener métricas y escalado controlado.

## Configuración
- **Engine**: Memcached `1.6`.
- **Node type**: `cache.t2.micro` (laboratorio, coste bajo).
- **Nodos**: 1 (en pruebas; en prod escalaría y distribuiría).
- **Puerto**: `11211`.
- **VPC/Subnet Group**: VPC por defecto; subred por AZ.
- **Security Group**: `vprofile-backend-sg`.

## Pasos que seguí
1. Creé **Subnet Group** de ElastiCache ( no existía).
2. Definí un **Parameter Group** por si necesito tunear TTLs u otras opciones.
3. Desplegué el **cluster** con el puerto **11211**.
4. Anoté el **Configuration Endpoint** para `application.properties`.

## Verificación
- Conectividad desde **instancia utilitaria** (si procede) y, finalmente, desde **EB**.
- Latencias y métricas de acierto (cuando la app esté enviando tráfico).

> [!TIP]
> En `application.properties` siempre uso el **endpoint de configuración** del cluster, no IPs sueltas. Así no sufro reboots o cambios.
