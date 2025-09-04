# Load Balancer & DNS

## Target Group (TG)
- **Tipo**: Instances
- **Nombre**: `vprofile-las-tg`
- **Protocolo**: HTTP `:8080`
- **Health check**: `/` (override port 8080 si procede)
- Registro `app01` como target

## ALB
- **Nombre**: `vprofile-las-elb`
- **Listeners**: `HTTP :80` (si no tengo dominio/cert aún) o `HTTPS :443` con ACM
- **SG**: `vprofile-ELB-SG`
- **AZ**: al menos dos subnets públicas
- **Forward** a `vprofile-las-tg`

Accedo por el **DNS del ALB**:

http://<ALB_DNS_NAME>/

> Este paso (TG → ALB → probar por DNS público del ALB) ya lo había 