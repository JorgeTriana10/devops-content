# Bash – fundamentos rápidos

## 1) Scripts: cómo se crean y ejecutan
Todo script empieza con **shebang**:

```bash
#!/usr/bin/env bash
```

Uso `env` para que sea portable (encuentra bash según el PATH).

**Permisos y ejecución:**
```bash
chmod +x ./script.sh
./script.sh
```

**Errores típicos:**
- Ejecutar sin permisos (`Permission denied`).
- Guardar con saltos de línea Windows (CRLF).  
  👉 Solución: `dos2unix` o configurar VSCode a LF.

---

## 2) Plantilla mínima robusta

```bash
#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_NAME="$(basename -- "${BASH_SOURCE[0]}")"

cleanup() { :; }
trap cleanup EXIT

die()  { echo "ERROR: $*" >&2; exit 1; }
log()  { printf '%s\n' "$*"; }
```

---

## 3) PATH, shebang y shells
- `#!/bin/sh` puede no ser bash. Usa siempre bash si empleas arrays o `[[ ]]`.
- Scripts ejecutables en `~/bin` o `./scripts`, añade al `PATH` en `~/.bashrc`.

---

## 4) Comentarios y estilo
- Comentarios claros.
- Constantes en **MAYÚSCULAS**, variables locales en minúsculas.
- Indentación consistente.

---

## 5) Comandos base
```bash
uptime
free -m
df -h
ip addr
systemctl status
journalctl -u <svc> -e
```

---

## 6) Servicios (systemd)
```bash
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl restart httpd
sudo systemctl status httpd
```

---

## 7) Redirecciones y pipes
- `>` sobrescribe; `>>` añade.
- `2>` stderr; `&>` stdout+stderr.
- `|` conecta stdout con stdin.

