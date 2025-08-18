# La función log() en Bash

## ¿Qué es?
En Bash no existe por defecto una función llamada `log()`. Se trata de una función definida por el usuario con el objetivo de estandarizar la forma en que un script imprime mensajes en la consola o en un archivo.  

Aunque a simple vista pueda parecer solo estética (añadir prefijos, colores o marcas de tiempo), en realidad aporta mucho más valor práctico en entornos de desarrollo y DevOps.

## ¿Para qué sirve?
La función `log()` se utiliza para:
- Mostrar mensajes con un formato uniforme y fácil de leer.
- Incluir información adicional como la hora exacta, el nivel de severidad o el PID del proceso.
- Filtrar mensajes según su importancia (ejemplo: mostrar solo errores en producción).
- Guardar la salida en archivos de log para su posterior revisión.
- Integrarse con sistemas de logging y monitorización (syslog, journald, ELK, CloudWatch, etc.).

## Ejemplo básico
```bash
log() {
  local level="${1:-INFO}"
  shift
  local msg="$*"
  local ts
  ts="$(date '+%Y-%m-%d %H:%M:%S')"
  echo "$ts [$level] $msg"
}

log INFO "Inicio del script"
log WARN "Queda poco espacio en disco"
log ERROR "No se pudo conectar a la base de datos"
