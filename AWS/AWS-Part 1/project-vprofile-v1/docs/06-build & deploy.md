# Build & Deploy Artifacts (Maven + S3)

## Build local del `.war`
1. Ajusto `src/main/resources/application.properties` para que la app apunte a:

db.host=db01.<HOSTED_ZONE_NAME>
mc.host=mc01.<HOSTED_ZONE_NAME>
rmq.host=rmq01.<HOSTED_ZONE_NAME>

2. Compilo:

mvn clean install

El artefacto queda en target/<app>.war.

    Este cambio de endpoints a DNS privado lo tenía reflejado en mis apuntes. 

Subida a S3

    Creo un bucket <BUCKET_NAME> (versionado opcional).

    Subo el .war:

    aws s3 cp target/<app>.war s3://<BUCKET_NAME>/

Despliegue en app01 (Tomcat)

# En la instancia app01 (con rol IAM que permita S3:GetObject)
aws s3 cp s3://<BUCKET_NAME>/<app>.war /tmp/app.war


```markdown
sudo systemctl stop tomcat10
sudo rm -rf /var/lib/tomcat10/webapps/ROOT /var/lib/tomcat10/webapps/ROOT.war
sudo cp /tmp/app.war /var/lib/tomcat10/webapps/ROOT.war
sudo chown tomcat:tomcat /var/lib/tomcat10/webapps/ROOT.war
sudo systemctl start tomcat10
sudo journalctl -u tomcat10 -f




En mis notas dejé el mismo flujo: parar Tomcat, sustituir WAR, arrancar y seguir logs. 
    
```