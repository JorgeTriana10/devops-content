# Auto Scaling Group (ASG)

## 1) AMI de app01
- Creo una imagen (AMI) de `app01` ya configurada y probada.

## 2) Launch Template
- Selecciono la AMI anterior, tipo `t2.micro/t3.micro`, SG `vprofile-app-sg`, key pair del entorno, tags.

## 3) ASG
- **Nombre**: `vprofile-asg`
- **VPC/AZ**: mismas subnets que el ALB (para registro en TG)
- **Attach to LB**: asocio el TG `vprofile-las-tg`
- **Health checks**: **ELB** (mejor que EC2)
- **Capacity**: `min=1`, `desired=1`, `max=3` (ajusto luego)
- **Políticas**: por CPU o por RequestCount si quiero algo más fino
- **Stickiness (en TG)**: activo si mi sesión lo necesita

Valido que las instancias del ASG entran en **healthy** y sirven tráfico vía ALB.

> Mis notas ya incluían AMI → Launch Template → ASG con health checks del LB y stickiness si hay sesiones. :contentReference[oaicite:11]{index=11}
