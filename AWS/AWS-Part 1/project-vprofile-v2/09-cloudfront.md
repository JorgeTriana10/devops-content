<!-- 09-cloudfront.md -->
# 09 — CloudFront (CDN delante del ALB)

> [!NOTE]
> Añadí **CloudFront** delante del **ALB** de Beanstalk para mejorar la **latencia global** y centralizar **TLS** en el edge. Reconfiguré el **CNAME** del dominio para que apunte a la distribución.

## Pasos que seguí
1. **Origen**: selecciono el **ALB** del entorno EB como **origin** de la distribución.
2. **Comportamientos**: por defecto **GET/HEAD**; fuerzo **redirección a HTTPS**.
3. **Caché**:
   - Para **estáticos** (CSS/JS/imagenes): TTLs más altos.
   - Para **rutas dinámicas/API**: TTL bajos o no cachear, respetando headers.
4. **Dominio y TLS**:
   - Configuro **Alternate Domain Name (CNAME)**: `app.midominio.com`.
   - Asocio **certificado ACM** en **us-east-1** (requisito de CloudFront).
   - En **DNS**, cambio el **CNAME** para que apunte a la **distribución de CloudFront** (ya no al ALB/EB).
5. **(Opcional) WAF** para protección L7 en la distribución.

## Diagrama (flujo de usuario)
~~~mermaid
flowchart LR
  U[Usuario global] --> CF[CloudFront]
  CF -->|Cache HIT| U
  CF -->|Cache MISS| ALB[ALB de EB]
  ALB --> EB[Instancias EB]
~~~

## Validaciones que hice
- Certificado válido y **HTTPS** forzado desde el edge.
- **HIT** en contenidos estáticos (compruebo métricas de CloudFront).
- Backends siguen **healthy** y sin errores de origen.

## Errores/pitfalls comunes
- **Certificado en región distinta** a us-east-1 → no aparece en CloudFront.
- Dejar el **CNAME** apuntando al ALB en vez de a CloudFront → el CDN no entra en juego.
- TTL de DNS alto → tarda en propagarse el cambio.

## Checklist de cierre
- [x] Distribución activa y **Deployment complete**.  
- [x] CNAME/DNS apuntando a CloudFront.  
- [x] TLS correcto en el edge.  
- [x] Métricas de **Cache HIT** razonables para estáticos.
