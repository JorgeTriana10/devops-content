# Gestión de Usuarios y Grupos en Linux

Comandos clave para añadir, eliminar y modificar usuarios y grupos.

---

## Usuarios

```bash
useradd usuario
````

* Crea un nuevo usuario.

```bash
useradd -m usuario
```

* Crea el usuario con su directorio home.

```bash
useradd -s /bin/bash usuario
```

* Define la shell por defecto del usuario.

```bash
useradd -d /ruta/personalizada usuario
```

* Define un directorio home personalizado.

```bash
passwd usuario
```

* Asigna o cambia la contraseña de un usuario.

```bash
su usuario
```

* Cambia al usuario especificado.

```bash
sudo -i
```

* Cambia al usuario root.

```bash
whoami
```

* Muestra el usuario actual.

```bash
last
```

* Muestra últimos usuarios que iniciaron sesión.

```bash
id usuario
```

* Muestra el UID, GID y grupos del usuario.

---

## Grupos

```bash
groupadd grupo
```

* Crea un nuevo grupo.

```bash
groupdel grupo
```

* Elimina un grupo.

```bash
usermod -aG grupo usuario
```

* Añade un usuario a un grupo (sin quitarlo de otros).

```bash
groups usuario
```

* Muestra a qué grupos pertenece un usuario.

```bash
gpasswd -d usuario grupo
```

* Elimina al usuario del grupo.

---

## Eliminación

```bash
userdel usuario
```

* Elimina al usuario (no borra su home).

```bash
userdel -r usuario
```

* Elimina al usuario y su directorio home.

---

````

---

