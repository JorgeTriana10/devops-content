# Condicionales en Bash

## 1) Sintaxis básica
- `if [ condición ]; then ... fi`
- `if [[ condición ]]; then ... fi`
- `if ... elif ... else ... fi`
- `case` para múltiples ramas.

**Nota:**  
- Usa `[[ ... ]]` siempre que puedas (es más seguro, soporta `=~`, `&&`, `||` sin problemas).  
- `[` y `test` son más limitados (POSIX).

---

## 2) Operadores numéricos
En **[ ]** o `test`:
- `-eq` → igual a  
- `-ne` → distinto  
- `-lt` → menor que  
- `-le` → menor o igual  
- `-gt` → mayor que  
- `-ge` → mayor o igual  

Ejemplo:
```bash
n=5
if [ "$n" -gt 3 ]; then
  echo "n es mayor que 3"
fi
```

Con `(( ... ))` (solo en bash/ksh):
```bash
n=5
if (( n > 3 && n <= 10 )); then
  echo "n está entre 4 y 10"
fi
```

---

## 3) Operadores de cadenas
En **[[ ... ]]**:
- `==`  → igual  
- `!=`  → distinto  
- `<`   → menor (orden lexicográfico)  
- `>`   → mayor (orden lexicográfico)  
- `-z`  → longitud cero  
- `-n`  → longitud no cero  

Ejemplo:
```bash
a="hola"
b="adios"

if [[ "$a" != "$b" ]]; then
  echo "son diferentes"
fi

if [[ -z "$a" ]]; then
  echo "cadena vacía"
fi
```

Regex:
```bash
s="abc123"
if [[ "$s" =~ ^[a-z]+[0-9]+$ ]]; then
  echo "cumple patrón"
fi
```

---

## 4) Comprobadores de archivos
- `-e`  → existe (fichero o dir)  
- `-f`  → fichero regular  
- `-d`  → directorio  
- `-r`  → legible  
- `-w`  → escribible  
- `-x`  → ejecutable  
- `-s`  → tamaño mayor que 0  
- `-L`  → enlace simbólico  
- `-b`  → bloque especial (disco, etc.)  
- `-c`  → carácter especial (terminal, etc.)  

Ejemplo:
```bash
if [[ -f /etc/passwd ]]; then
  echo "el archivo existe"
fi
```

---

## 5) Operadores lógicos
- `!`  → negación  
- `&&` → AND  
- `||` → OR  

Ejemplo:
```bash
if [[ -d /var/www && -w /var/www/html ]]; then
  echo "directorio existe y es escribible"
fi
```

---

## 6) case
Estructura clara para muchas opciones:
```bash
case "$1" in
  start) echo "iniciando";;
  stop)  echo "deteniendo";;
  restart) echo "reiniciando";;
  *) echo "uso: $0 {start|stop|restart}"; exit 1;;
esac
```

---

## 7) Ejemplo completo
```bash
read -p "Introduce un número: " n

if [[ "$n" =~ ^[0-9]+$ ]]; then
  if (( n -gt 10 )); then
    echo "n > 10"
  elif (( n -eq 10 )); then
    echo "n = 10"
  else
    echo "n < 10"
  fi
else
  echo "No es un número válido"
fi
```
