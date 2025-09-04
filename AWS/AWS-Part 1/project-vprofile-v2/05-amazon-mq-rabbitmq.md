<!-- 05-amazon-mq-rabbitmq.md -->
# 05 — Amazon MQ (RabbitMQ)

> [!SUMMARY]
> Externalicé la mensajería a **Amazon MQ (RabbitMQ)** en despliegue **privado**. Evito administrar nodos y obtengo monitoreo integrado.

## Configuración
- **Engine**: RabbitMQ.
- **Clase**: `mq.t3.micro` (lab).
- **Despliegue**: instancia única (para pruebas).
- **Acceso**: **Privado** en VPC.
- **Security Group**: `vprofile-backend-sg`.
- **Usuarios**: creé usuario de app (ej. `rabbit`) con contraseña de laboratorio.

## Puertos y TLS
- **5671** (TLS) para la aplicación.
- **15672** (consola web) — sólo si habilito acceso administrativo desde una subred/SG controlado.

## Pasos que seguí
1. Creé el **broker** RabbitMQ en Amazon MQ.
2. Registré **endpoint AMQPS** (TLS) y credenciales.
3. Preparé reglas de **inbound** en `vprofile-backend-sg` para que **EB** pueda consumir `5671`.

## Nota operativa
- En producción usaría **alta disponibilidad** (multi-AZ) y rotación de credenciales/Secrets Manager.

> [!WARNING]
> Es fácil confundir `5672` (no TLS) con **`5671` (TLS)**. La app debe apuntar a **`5671`**.
