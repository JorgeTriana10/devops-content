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
  El script comprueba si `yum` está disponible para determinar si el sistema es CentOS/Red Hat.  
  Si no lo está, asume que se trata de Ubuntu/Debian.

- **En CentOS**:
  - Instala `httpd`, `wget` y `unzip`.
  - Descarga una plantilla web desde [tooplate.com](https://www.tooplate.com/).
  - Despliega los archivos en `/var/www/html/`.
  - Inicia y habilita el servicio `httpd`.

- **En Ubuntu**:
  - Instala `apache2`, `wget` y `unzip`.
  - Descarga y despliega la misma plantilla.
  - Inicia y habilita el servicio `apache2`.

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