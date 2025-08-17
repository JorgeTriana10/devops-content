# Bucles en Bash

Los bucles permiten repetir la ejecución de comandos mientras se cumpla una condición, sobre listas o hasta que se cumpla un criterio de salida.  

---

## 1) Sintaxis general

### `for` (lista de elementos)
```bash
for i in elem1 elem2 elem3; do
  echo "$i"
done
```
- Itera sobre cada elemento de la lista.
- La lista puede ser explícita (`a b c`) o generada (`*.txt` para todos los ficheros `.txt`).

### `for` estilo C
```bash
for (( i=1; i<=10; i++ )); do
  echo "Iteración $i"
done
```
- Sintaxis similar a C: inicialización; condición; incremento.

### `for` con rango (brace expansion)
```bash
for i in {1..5}; do
  echo "$i"
done
```
- Expande automáticamente un rango de números.

### `for` sobre arrays
```bash
arr=(uno dos tres)
for i in "${arr[@]}"; do
  echo "$i"
done
```

### `for` sobre arrays asociativos
```bash
declare -A capitales=([España]=Madrid [Francia]=París)
for k in "${!capitales[@]}"; do
  echo "$k -> ${capitales[$k]}"
done
```

---

## 2) `while`

Ejecuta comandos **mientras la condición sea verdadera**.

```bash
i=0
while (( i <= 5 )); do
  echo "i = $i"
  ((i++))
done
```

Otro Ejemplo :
```bash
#!/bin/bash

counter=0

while [ $counter -lt 5 ]
do
  echo "Looping..."
  echo "Value of counting is $counter"
  counter=$(($counter + 1))
  sleep 1
done

echo "Out of the loop"

```

---

## 3) `until`

Ejecuta comandos **hasta que la condición sea verdadera**.

```bash
i=0
until (( i > 5 )); do
  echo "i = $i"
  ((i++))
done
```

---

## 4) Lectura de ficheros línea a línea

### Con `for` (no recomendado para texto complejo)
```bash
for linea in $(cat archivo.txt); do
  echo "$linea"
done
```
- **Problema**: separa por espacios/tabs además de saltos de línea.

### Con `while read` (recomendado)
```bash
while IFS= read -r linea; do
  echo "$linea"
done < archivo.txt
```
- Usa `IFS=$'\n'` para separar solo por nuevas líneas.
- Opción `-r` evita que `\` sea interpretado como escape.

---

## 5) Control de bucles
- `break` → salir del bucle actual.  
- `break N` → salir de N niveles de bucles anidados.  
- `continue` → saltar a la siguiente iteración.  

Ejemplo:
```bash
for i in {1..5}; do
  if (( i == 3 )); then
    continue   # salta el 3
  fi
  echo "$i"
done
```

---

## 6) El bucle `select` (menús interactivos)

Crea menús de texto para el usuario:

```bash
options="opcion1 opcion2 salir"
select opt in $options; do
  case $opt in
    opcion1) echo "Has elegido opción 1";;
    opcion2) echo "Has elegido opción 2";;
    salir) break;;
    *) echo "Opción inválida";;
  esac
done
```

---

## 7) Ejemplos prácticos

### Listar todos los ficheros `.log`
```bash
for f in *.log; do
  echo "Encontrado: $f"
done
```

### Monitorizar hasta que un servicio arranque
```bash
until systemctl is-active --quiet httpd; do
  echo "Esperando a que arranque httpd..."
  sleep 2
done
echo "httpd activo"
```

### Leer usuarios de `/etc/passwd`
```bash
while IFS=: read -r user _; do
  echo "Usuario: $user"
done < /etc/passwd
```

---

## 8) Resumen rápido
- **for**: sobre listas, rangos, arrays.  
- **while**: mientras la condición sea verdadera.  
- **until**: mientras la condición sea falsa (lo opuesto de `while`).  
- **select**: menús interactivos.  
- Usa siempre `while read` para leer ficheros de forma robusta.  
