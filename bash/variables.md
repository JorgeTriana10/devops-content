# Variables, quotes, sustitución y entorno

## 1) Asignación y expansión
```bash
skill="DevOps"
echo "$skill"
```

## 2) Comillas
- `'simples'`: literal.
- `"dobles"`: expande variables y escapes.

## 3) Sustitución de comandos
```bash
now="$(date +%F)"
users="$(who | wc -l)"
```

## 4) Variables de entorno
```bash
SEASON="Monsoon"
export SEASON
```
Persistencia: `~/.bashrc` (usuario), `/etc/profile` (global).

## 5) Variables especiales
`$?`, `$$`, `$PPID`, `$UID`, `$RANDOM`, `$SECONDS`, `$HOSTNAME`, `$PWD`, `$PATH`, `$OSTYPE`.

## 6) Aritmética
```bash
n=$(( 3 + 4 ))
(( n > 5 )) && echo "ok"
```

## 7) Arrays
```bash
arr=(a b c)
echo "${arr[0]}"
printf '%s\n' "${arr[@]}"
```

## 8) Arrays asociativos
```bash
declare -A m=([env]=prod [region]=eu)
echo "${m[env]}"
for k in "${!m[@]}"; do echo "$k -> ${m[$k]}"; done
```

## 9) Expansión de parámetros
```bash
: "${VAR:=default}"      # asigna default si VAR no existe o está vacía
echo "${VAR:-default}"   # usa default si está vacía/no set
echo "${#VAR}"           # longitud
echo "${VAR:2:3}"        # subcadena
file="app.log.gz"
echo "${file%.gz}"       # quita sufijo .gz -> app.log
echo "${file##*.}"       # extensión -> gz
```