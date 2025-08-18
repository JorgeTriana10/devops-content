# Remote Command Execution Project

Este proyecto muestra cómo configurar y ejecutar comandos remotos en varias máquinas virtuales (VMs) desde un host central de administración (`scriptbox`).  
El objetivo es automatizar la instalación y despliegue de un servidor web sencillo (Apache HTTPD en CentOS, Apache2 en Ubuntu) en distintos entornos.

---

## Estructura del proyecto

```text
remote-cmd-exec/
├── multios_websetup.sh
├── remhosts
├── webdeploy.sh
└── README.md
```


### 1. `multios_websetup.sh`
Este script instala y configura un servidor web dependiendo del sistema operativo de la VM destino.

- **Detección del sistema operativo**:  
  El script hace yum --help &> /dev/null y mira $? (el código de salida):
	- 0 → existe yum → asume CentOS/RHEL.
	- distinto de 0 → asume Ubuntu/Debian.

### Ejecución en CentOS

En sistemas **CentOS/RHEL** el script realiza las siguientes acciones:

1. **Instala paquetes necesarios**  
   ```bash
   sudo yum install httpd wget unzip -y
   ```
   Esto instala el servidor web `httpd`, el descargador `wget` y la utilidad `unzip`.

2. **Arranca y habilita el servicio**  
   ```bash
   sudo systemctl start httpd
   sudo systemctl enable httpd
   ```

3. **Crea un directorio temporal y despliega la web**  
   ```bash
   mkdir -p /tmp/webfiles
   cd /tmp/webfiles
   wget https://www.tooplate.com/zip-templates/2098_health.zip
   unzip 2098_health.zip
   sudo cp -r 2098_health/* /var/www/html/
   ```

4. **Reinicia el servicio para aplicar cambios**  
   ```bash
   sudo systemctl restart httpd
   ```

5. **Limpieza y verificación**  
   ```bash
   rm -rf /tmp/webfiles
   sudo systemctl status httpd
   ls /var/www/html
   ```

### Ejecución en Ubuntu/Debian

En sistemas **Ubuntu/Debian** el script realiza las siguientes acciones:

1. **Actualiza repositorios e instala paquetes necesarios**  
   ```bash
   sudo apt update
   sudo apt install apache2 wget unzip -y
   ```
   Esto instala el servidor web `apache2`, el descargador `wget` y la utilidad `unzip`.

2. **Arranca y habilita el servicio**  
   ```bash
   sudo systemctl start apache2
   sudo systemctl enable apache2
   ```

3. **Crea un directorio temporal y despliega la web**  
   ```bash
   mkdir -p /tmp/webfiles
   cd /tmp/webfiles
   wget https://www.tooplate.com/zip-templates/2098_health.zip
   unzip 2098_health.zip
   sudo cp -r 2098_health/* /var/www/html/
   ```

4. **Reinicia el servicio para aplicar cambios**  
   ```bash
   sudo systemctl restart apache2
   ```

5. **Limpieza y verificación**  
   ```bash
   rm -rf /tmp/webfiles
   sudo systemctl status apache2
   ls /var/www/html
   ```



De este modo, el script es portable entre distintas distribuciones Linux.

---

### 2. `remhosts`
Este fichero contiene la lista de VMs destino donde se realizará el despliegue.  
Cada línea corresponde a un nombre de host configurado en el `/etc/hosts` o resoluble por DNS.

Ejemplo de contenido:

```text
web01
web02
web03
```

---

### 3. `webdeploy.sh`
Este es el script principal de despliegue. Se ejecuta localmente en `scriptbox` y realiza las siguientes acciones para cada host listado en `remhosts`:

1. **Copia del script**  
   Usa `scp` para transferir `multios_websetup.sh` al directorio `/tmp/` de la VM destino.

2. **Ejecución remota**  
   Se conecta vía `ssh` como usuario `devops` y ejecuta el script con `sudo`.

3. **Limpieza**  
   Elimina el script de `/tmp/` una vez finalizada la ejecución.

4. **Iteración**  
   Repite el proceso para todos los hosts definidos en `remhosts`.

Esto garantiza un despliegue consistente en múltiples máquinas con el mínimo esfuerzo manual.

---

## Entorno

- Host central de administración:  
  - `192.168.10.12` → `scriptbox` (CentOS)  

- VMs destino:  
  - `192.168.10.13` → `web01` (CentOS)  
  - `192.168.10.14` → `web02` (CentOS)  
  - `192.168.10.15` → `web03` (Ubuntu)  

Todas las acciones remotas se ejecutan con el usuario `devops`, que debe tener acceso SSH y privilegios `sudo` en cada VM.

---

## Uso

1. Colocar todos los ficheros en `/opt/scripts/remote_websetup/` en `scriptbox`.  
2. Configurar autenticación SSH sin contraseña (clave pública) para el usuario `devops`.  
3. Ejecutar el script de despliegue:
   ```bash
   ./webdeploy.sh

    Tras la ejecución, cada VM tendrá un servidor web en funcionamiento accesible por HTTP.