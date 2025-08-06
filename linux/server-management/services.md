# Gestión de Servicios con systemctl

Comandos para administrar servicios del sistema con `systemctl`.

---

## Estado de servicios

```bash
systemctl status servicio
````

* Muestra si el servicio está activo, habilitado, errores.

```bash
systemctl is-active servicio
```

* Solo muestra si está activo (active/inactive).

```bash
systemctl is-enabled servicio
```

* Indica si el servicio se inicia al arrancar.

---

## Iniciar / detener servicios

```bash
systemctl start servicio
```

* Inicia el servicio.

```bash
systemctl stop servicio
```

* Detiene el servicio.

```bash
systemctl restart servicio
```

* Reinicia el servicio (stop + start).

```bash
systemctl reload servicio
```

* Recarga configuración sin reiniciar.

---

## Habilitar al arranque

```bash
systemctl enable servicio
```

* Habilita servicio para que arranque con el sistema.

```bash
systemctl disable servicio
```

* Desactiva el inicio automático.

```bash
systemctl mask servicio
```

* Impide que se arranque incluso manualmente.

```bash
systemctl unmask servicio
```

* Quita el bloqueo de `mask`.

---

## Ver servicios habilitados

```bash
ls /etc/systemd/system/multi-user.target.wants/
```

* Lista los servicios que se inician al arrancar.

---

## Listar y buscar

```bash
systemctl list-units --type=service
```

* Lista todos los servicios activos.

```bash
systemctl list-unit-files
```

* Lista todos los servicios instalados.

```bash
systemctl | grep servicio
```

* Filtra servicios con grep.

---

## Logs de servicios

```bash
journalctl -u servicio
```

* Muestra el log del servicio completo.

```bash
journalctl -xe
```

* Logs del sistema con errores recientes.

---

```

---

¿Quieres que te empaquete estos `.md` como archivo `.zip` o los prepare para que puedas subirlos directamente a GitHub desde VS Code?
```
