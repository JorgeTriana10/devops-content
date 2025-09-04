#  EC2 Instances

Lanzo 4 instancias:
- `vprofile-db01` (MySQL) — Amazon Linux
- `vprofile-mc01` (Memcached) — Amazon Linux
- `vprofile-rmq01` (RabbitMQ) — Amazon Linux
- `vprofile-app01` (Tomcat) — Ubuntu

Todas en la VPC del proyecto y con los SG anteriores.

## User-Data (provisión básica)
Coloco scripts mínimamente seguros (sin secretos) en `../scripts/` y los pego en user-data al lanzar:

- `scripts/user-data-mysql.sh` → instala y expone `:3306` hacia `vprofile-app-sg`.
- `scripts/user-data-memcached.sh` → `:11211`.
- `scripts/user-data-rabbitmq.sh` → `:5672` (usuario local de prueba si hace falta).
- `scripts/user-data-app.sh` → Java + Tomcat 10, deja preparado `/var/lib/tomcat10/webapps/ROOT.war`.



> En mis notas originales ya tenía listados los puertos de cada servicio y el uso de user-data para automatizar. 

## Consejos rápidos
- Taggear Name = `vprofile-<role>` para verlo claro en consola.
- Evitar IP públicas en backends (solo privadas).
