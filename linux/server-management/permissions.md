# Permisos y Propiedades en Linux

Gestión de permisos, propietarios y modos de acceso a archivos y directorios.

---

## Tipos de permisos

- `r` → read (lectura) = 4
- `w` → write (escritura) = 2
- `x` → execute (ejecución) = 1

Permisos en tres bloques: propietario, grupo, otros.

Ejemplo:
````

-rwxr-xr-x

````

---

## Cambiar permisos (`chmod`)

```bash
chmod 755 archivo
````

* rwx para el propietario, rx para grupo y otros.

```bash
chmod u+x script.sh
```

* Añade permiso de ejecución al propietario.

```bash
chmod go-rwx archivo
```

* Quita permisos a grupo y otros.

```bash
chmod a+r archivo
```

* Da permiso de lectura a todos.

```bash
chmod u=r,g=,o= archivo
```

* Define permisos específicos para cada parte.

---

## Cambiar propietario (`chown`)

```bash
chown usuario archivo
```

* Cambia el propietario del archivo.

```bash
chown usuario:grupo archivo
```

* Cambia propietario y grupo.

---

## Tipos de archivos

| Símbolo | Tipo                      |
| ------- | ------------------------- |
| -       | Archivo regular           |
| d       | Directorio                |
| l       | Enlace simbólico          |
| c       | Dispositivo de caracteres |
| b       | Dispositivo de bloques    |
| s       | Socket                    |
| p       | FIFO (named pipe)         |

---

## Información útil

```bash
ls -l
```

* Muestra permisos de todos los archivos.

```bash
stat archivo
```

* Detalles de permisos, propietario, inodo, etc.

---

````

---
