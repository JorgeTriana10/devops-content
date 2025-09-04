<!-- 02-security-groups-y-keypairs.md -->
# 02 — Security Groups y Key Pairs

> [!NOTE]
> Preparé la **base de red**: un **Security Group de backend** y el **Key Pair** para acceso de diagnóstico a instancias. El objetivo es permitir tráfico **este-oeste** entre servicios del backend y, más tarde, **autorizar EB** como único consumidor.

## SG de backend (política)
- **Nombre**: `vprofile-backend-sg`
- **Inbound**:
  - “Self” (permitir todo desde su propio SG) para que RDS ↔ MQ ↔ Memcached se hablen entre sí sin abrir al mundo.
  - Cuando exista EB, **permito inbound desde el SG de EB** (regla explícita) para DB (3306), MQ (5671), Cache (11211).
- **Outbound**: por defecto permitido hacia VPC (restringible si lo necesito).

## Flujo de creación
1. Creo `vprofile-backend-sg` **sin inbound**.
2. Añado regla **Self** (All traffic → `vprofile-backend-sg`).
3. Cuando EB cree **su propio SG**, añado **reglas por puerto** permitiendo **origen = SG-EB**.

## Key Pair
- Generé un **Key Pair** para entrar a instancias (si EB expone bastión o si levanto instancias utilitarias).
- Lo guardé cifrado en mi equipo (formato `.pem`).

## Tabla de puertos (referencia)
| Servicio | Puerto | Origen permitido                        |
|---------:|:------:|-----------------------------------------|
|   MySQL  |  3306  | SG de EB y Self en backend              |
| RabbitMQ |  5671  | SG de EB (TLS) y Self en backend        |
| Memcache |  11211 | SG de EB y Self en backend              |

> [!TIP]
> Para auditar, dejo etiquetas (tags) coherentes: `Project=vprofile`, `Tier=backend`, `Owner=yo`.
