<!-- 03-rds.md -->
# 03 — RDS (MySQL)

> [!SUMMARY]
> Aprovisioné **RDS MySQL** como base de datos **privada** dentro de la VPC. No expongo público, y la conexión la hará únicamente **Elastic Beanstalk** vía SG.

## Parámetros principales
| Campo            | Valor (laboratorio)             | Motivo |
|------------------|---------------------------------|--------|
| Engine           | MySQL 8.0                       | Compatibilidad y features actuales |
| Clase            | `db.t4g.micro` (free tier)      | Coste bajo en pruebas |
| Almacenamiento   | gp3 · 20 GB                     | Sólido, barato y elástico |
| Acceso público   | **No**                          | Privado por defecto |
| VPC/Subnets      | VPC por defecto, subnets en AZ  | Alta disponibilidad lógica |
| SG asociado      | `vprofile-backend-sg`           | Encapsular tráfico backend |
| Puerto           | `3306`                          | Estándar MySQL |
| DB inicial       | `accounts`                      | La que consume la app |

## Parameter y Subnet Groups
- **DB Subnet Group**: subredes privadas en 2+ AZ.
- **Parameter Group**: familia MySQL 8.0 (dejo valores por defecto; los ajusto si la app lo requiere).

## Buenas prácticas que apliqué
- Usuario **administrativo** guardado en secret seguro (no en repo).
- Deshabilité acceso público y **no** abrí 3306 a Internet.
- Dejé preparados **backups**/retención para cuando pase a entornos más serios.

## Resultado esperado
- Endpoint RDS **alcanzable sólo** desde SG de EB (cuando lo autorice).
- `accounts` lista para inicializar con el **dump** del proyecto.
