# Comandos de Redes en Linux

Comandos fundamentales para diagnosticar, analizar y configurar redes en sistemas Linux.

---

## ifconfig

Muestra la configuración de red de todas las interfaces.

```bash
ifconfig
```

* `lo`: interfaz de loopback (127.0.0.1)
* `eth0`, `ens33`, etc.: interfaces físicas o virtuales
* Incluye IP, MAC, estado (UP/DOWN)

---

## ip addr show

Alternativa moderna a `ifconfig`.

```bash
ip addr show
```

* Muestra interfaces, direcciones IP y estado
* Más completo y detallado

---

## ping

Envía paquetes ICMP a una IP o dominio para verificar conectividad.

```bash
ping google.com
ping 192.168.1.1
```

* `Ctrl + C` para detenerlo
* Usa TTL (time-to-live) y tiempo de respuesta

---

## traceroute / tracert

Muestra los saltos (routers) hasta un destino.

```bash
traceroute google.com    # Linux
tracert google.com       # Windows
```

* Diagnóstico de latencia y rutas
* Muestra IP de cada router intermedio

---

## netstat

Muestra las conexiones y puertos abiertos.

```bash
netstat -antp
```

* `-a`: todas las conexiones
* `-n`: sin resolución DNS
* `-t`: solo TCP
* `-p`: muestra el programa asociado

---

## ss

Reemplazo moderno de `netstat`.

```bash
ss -tunlp
```

* `-t`: TCP
* `-u`: UDP
* `-n`: sin DNS
* `-l`: solo puertos en escucha
* `-p`: muestra procesos

---

## nmap

Escanea puertos y detecta servicios en una IP o dominio.

```bash
nmap 192.168.1.1
nmap google.com
```

* Detecta servicios activos y puertos abiertos
* Requiere instalación previa

---

## dig

Consulta DNS para obtener la IP de un dominio.

```bash
dig google.com
```

* Devuelve registros A, NS, etc.
* Muestra qué servidor DNS responde

---

## nslookup

Consulta DNS sencilla.

```bash
nslookup google.com
```

* Alternativa a `dig` con salida más simple

---

## route -n

Muestra la tabla de enrutamiento.

```bash
route -n
```

* Visualiza puertas de enlace y rutas
* `-n`: evita resolución DNS

---

## arp

Muestra la tabla ARP (IP ↔ MAC).

```bash
arp
```

* Útil para ver qué dispositivos están conectados localmente

---

## mtr

Combinación de `ping` + `traceroute` en tiempo real.

```bash
mtr google.com
```

* Muestra latencia por salto
* Requiere instalación (`apt install mtr`)

---

## telnet

Prueba si un puerto está abierto en una máquina remota.

```bash
telnet 192.168.1.1 80
```

* Comprueba acceso a puertos específicos (web, SSH…)

---

## /etc/hosts

Archivo que permite resolver nombres sin usar DNS.

```bash
sudo nano /etc/hosts
```

* Formato: `IP nombre_dominio`
* Ejemplo: `192.168.1.10 miapp.local`

