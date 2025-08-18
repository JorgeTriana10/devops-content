#!/usr/bin/env bash
set -Eeuo pipefail

# Niveles aceptados
LEVELS=(DEBUG INFO WARN ERROR)

log() {
  local level="${1:-INFO}"
  shift || true
  local msg="$*"
  local ts
  ts="$(date '+%Y-%m-%d %H:%M:%S')"
  printf '%s [%s] %s\n' "$ts" "$level" "$msg"
}

# Ejemplo de uso
log INFO  "Iniciando script"
sleep 1
log DEBUG "Variable X=42"
sleep 1
log WARN  "Queda poco espacio en disco"
sleep 1
log ERROR "No se pudo conectar a la BD"
