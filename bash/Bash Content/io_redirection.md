# Redirecciones, pipes y lectura segura

## 1) Salida estándar y de error
- `cmd > out.txt`  → sobrescribe stdout
- `cmd >> out.txt` → añade stdout
- `cmd 2> err.txt` → stderr
- `cmd &> all.txt` → stdout+stderr

## 2) Pipes
```bash
ls | grep host
free -m | grep Mem
```

## 3) Here-doc y here-string
```bash
cat > file.conf <<'EOF'
linea literal $NO_EXPANDE
EOF

grep foo <<< "una sola línea en stdin"
```

## 4) Redirigir todo el script
```bash
exec >"script.out" 2>"script.err"
```

## 5) Leer línea a línea (espacios seguros)
```bash
while IFS= read -r line; do
  printf '%s\n' "$line"
done < "archivo.txt"
```

## 6) NUL-delimitado (nombres con saltos de línea)
```bash
find . -type f -print0 | while IFS= read -r -d '' f; do
  printf '%q\n' "$f"
done
```

## 7) tee para ver y guardar a la vez
```bash
make 2>&1 | tee build.log
```