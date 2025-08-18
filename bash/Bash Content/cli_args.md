# Argumentos de línea de comandos y parámetros especiales

## 1) Posicionales
- `$0`: script
- `$1..$n`: argumentos
- `$#`: número de args
- `"$@"`: todos, preservando tokens
- `"$*"`: todos en uno 

## 2) Validación mínima
```bash
[ "$#" -ge 2 ] || { echo "Uso: $0 <url> <art>"; exit 2; }
url="$1"; art="$2"; shift 2
```

## 3) Ejemplo práctico
```bash
wget "$url" -O "/tmp/${art}.zip"
unzip -q "/tmp/${art}.zip" -d "/tmp/${art}"
sudo cp -r "/tmp/${art}/"* /var/www/html/
```

## 4) Flags con getopts
```bash
#!/usr/bin/env bash
set -Eeuo pipefail

usage(){ echo "Uso: $0 [-f fichero] [-v] arg1"; }

verbose=0; file=""
while getopts ":f:v" opt; do
  case "$opt" in
    f) file="$OPTARG" ;;
    v) verbose=1 ;;
    \?) echo "Flag inválida: -$OPTARG"; usage; exit 2 ;;
    :)  echo "Flag -$OPTARG requiere valor"; usage; exit 2 ;;
  esac
done
shift $((OPTIND-1))

[ "$#" -ge 1 ] || { usage; exit 2; }
```

## 5) Códigos de salida
- `0`: éxito
- `>0`: error