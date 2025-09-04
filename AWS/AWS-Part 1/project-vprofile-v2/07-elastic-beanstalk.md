<!-- 07-elastic-beanstalk.md -->
# 07 — Elastic Beanstalk (Tomcat + ALB + Auto Scaling)

> **Resumen**  
> Desplegué la capa **web** con **Elastic Beanstalk (EB)** utilizando la plataforma **Tomcat**. EB me orquesta **ALB**, **Auto Scaling**, perfiles **IAM**, almacenamiento y ciclo de vida de despliegue. Después, conecté EB con los servicios del backend mediante **Security Groups**.

## Configuración del entorno EB
- **Plataforma**: Tomcat (Corretto Java).
- **Capacidad**: mínimo **2** instancias / máximo **4** (`t3.micro` en laboratorio).
- **Balanceador**: **Application Load Balancer** (público).
- **Almacenamiento en instancias**: **gp3** (evita plantillas antiguas).
- **Health checks**: apunto al **endpoint de la app** (por ejemplo, `/login`).
- **Sticky Sessions**: activadas si la sesión se mantiene en capa web.
- **IAM**: usé el **service role** y el **instance profile** recomendados por EB.

## Seguridad de red (integración con backend)
Cuando EB crea **su propio SG**, añado en **`vprofile-backend-sg`** reglas **por puerto** con **origen = SG de EB**:
- MySQL `3306`
- RabbitMQ (TLS) `5671`
- Memcached `11211`

Así, **solo** las instancias del entorno EB pueden hablar con **RDS / Amazon MQ / ElastiCache**.

## Políticas de despliegue (que considero/uso)
- **All-at-once**: rápido, mayor riesgo.
- **Rolling**: actualiza por lotes (menos impacto).
- **Rolling con instancias nuevas**: capacidad extra temporal.
- **Immutable**: arranca flota nueva y conmuta tráfico al final.
- **Traffic Splitting**: canary/AB breve con división de tráfico.

## Diagrama (ciclo de despliegue)
~~~mermaid
sequenceDiagram
  participant Yo as Yo
  participant EB as Elastic Beanstalk
  participant ASG as Auto Scaling Group
  participant ALB as ALB
  Yo->>EB: Subo artefacto (.war)
  EB->>ASG: Lanza/actualiza instancias
  ASG->>ALB: Registra targets (health OK)
  ALB->>Yo: Empieza a servir tráfico
~~~

## Logs y diagnóstico
- **EB Console → Logs**: pido “last 100 lines” o “bundle completo”.
- Conecto a una instancia (si es necesario) y reviso `catalina.out`.
- **Target Group** del ALB: estado de health por instancia.

## Checklist de cierre
- [x] Entorno EB en **green/healthy**.  
- [x] ALB con targets en **healthy**.  
- [x] SG de EB **autorizado** en `vprofile-backend-sg`.  
- [x] Política de despliegue configurada (p. ej., **Rolling**).
