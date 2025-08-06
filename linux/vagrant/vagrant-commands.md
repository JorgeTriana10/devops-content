# Comandos Vagrant esenciales

Comandos para gestionar máquinas virtuales con Vagrant.

---

## Inicializar y arrancar

```bash
vagrant init <box_name>
````

* Crea un archivo `Vagrantfile` con configuración base.

```bash
vagrant up
```

* Crea y arranca la VM.
* Si no está descargada, la descarga.

```bash
vagrant halt
```

* Apaga la VM (gracefully).

```bash
vagrant destroy
```

* Elimina la VM completamente.

```bash
vagrant reload
```

* Reinicia la VM (detiene y arranca de nuevo).

```bash
vagrant provision
```

* Vuelve a ejecutar el script de provisión.

```bash
vagrant reload --provision
```

* Reinicia la VM y reprovisiona en un solo paso.

---

## Conexión y estado

```bash
vagrant ssh
```

* Accede por SSH a la VM.

```bash
vagrant status
```

* Muestra el estado de la VM en la carpeta actual.

```bash
vagrant global-status
```

* Muestra todas las VMs gestionadas por Vagrant en el sistema.

---

## Gestión de boxes

```bash
vagrant box list
```

* Lista las boxes instaladas localmente.

```bash
vagrant box add <name> <url>
```

* Añade una nueva box desde URL o path local.

```bash
vagrant box remove <name>
```

* Elimina una box local.

```bash
vagrant box update
```

* Actualiza boxes instaladas si hay nueva versión.

---

## Carpetas sincronizadas

```ruby
config.vm.synced_folder ".", "/vagrant"
```

* Sincroniza la carpeta actual con `/vagrant` en la VM.

---

## Red privada/pública

```ruby
config.vm.network "private_network", ip: "192.168.56.10"
```

```ruby
config.vm.network "public_network"
```

* Asigna IP privada o usa red pública del host.

---

## Memoria y CPU

```ruby
vb.memory = "2048"
vb.cpus = 2
```

* Se configura dentro de `config.vm.provider "virtualbox"`.

---

## Multi-Machine

```ruby
config.vm.define "web" do |web|
  web.vm.hostname = "web"
  web.vm.network "private_network", ip: "192.168.56.11"
end
```

* Define múltiples VMs dentro de un mismo `Vagrantfile`.

---

## Tips

* Ejecutar `vagrant` desde la carpeta donde esté el `Vagrantfile`.
* Se puede tener múltiples VMs corriendo en paralelo si están en carpetas distintas.
* Usa `vagrant ssh <machine_name>` en entornos multi-VM.

