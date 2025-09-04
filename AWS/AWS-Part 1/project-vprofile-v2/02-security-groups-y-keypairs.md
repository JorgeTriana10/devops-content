Primero dejé creada la base de red y acceso:

SG-backend (RDS, ElastiCache, Amazon MQ) sin reglas iniciales y luego inbound “All traffic” desde sí mismo para permitir el tráfico este-oeste entre servicios (patrón habitual para backends conversando entre sí). Más tarde autorizaré el SG que genere Beanstalk.