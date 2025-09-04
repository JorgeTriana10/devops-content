# Security Groups & Key Pairs

## Security Groups que utilizo
1) **vprofile-ELB-SG**  
   - Inbound: `HTTPS :443` (o `HTTP :80` si voy sin cert)
   - Outbound: abierto por defecto (estándar de AWS)

2) **vprofile-app-sg** (Tomcat)  
   - Inbound:
     - `TCP :8080` **desde** `vprofile-ELB-SG` (origen = SG del ALB)
     - `SSH :22` **solo** desde mi IP (temporal para debug)
   - Outbound: por defecto

3) **vprofile-backend-sg** (MySQL/Memcached/RabbitMQ)  
   - Inbound:
     - `TCP :3306` **desde** `vprofile-app-sg`
     - `TCP :11211` **desde** `vprofile-app-sg`
     - `TCP :5672` **desde** `vprofile-app-sg`
     - (Regla extra) **self** → permitir tráfico interno entre backends
   - Outbound: por defecto

> Este diseño de SG lo tenía ya conceptualizado en mis notas y me funcionó bien: ALB → APP → BACKENDS, y permisos de SG a SG. :contentReference[oaicite:5]{index=5}

## Key Pairs
- Una key por entorno. Nomenclatura: `<project>-<env>-<region>`.
- Las `.pem` **no** se suben al repo.
