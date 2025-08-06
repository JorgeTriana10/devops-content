Guía detallada de Comandos Linux para DevOps

Gestión de Archivos y Directorios

	ls → Lista archivos y directorios.
		ls -l         → Muestra detalles de archivos (permisos, propietario, tamaño)
		ls -a         → Muestra archivos ocultos (que comienzan por punto)
		ls -lh        → Muestra tamaño de forma legible (KB, MB, GB)
		ls -l /etc    → Muestra archivos con detalle del directorio /etc

	cd → Cambia de directorio.
		cd /etc       → Se mueve al directorio /etc
		cd ..         → Sube al directorio superior
		cd ~          → Se mueve al directorio home del usuario actual

	pwd → Muestra la ruta actual completa.
		pwd           → Muestra la ruta completa del directorio actual

	mkdir → Crear directorios.
		mkdir proyecto          → Crea un directorio llamado proyecto
		mkdir -p dir1/dir2      → Crea una estructura completa de directorios

	touch → Crea archivos vacíos o actualiza fecha de modificación.
		touch archivo.txt       → Crea archivo.txt
		touch archivo{1..5}.txt → Crea archivos numerados del 1 al 5

	cp → Copia archivos o directorios.
		cp origen.txt destino.txt      → Copia archivo origen.txt a destino.txt
		cp -r carpeta1 carpeta2        → Copia todo el contenido de carpeta1 a carpeta2

	mv → Mueve o renombra archivos/directorios.
		mv viejo.txt nuevo.txt         → Renombra viejo.txt a nuevo.txt
		mv archivo.txt /tmp/           → Mueve archivo.txt al directorio /tmp

	rm → Elimina archivos o directorios.
		rm archivo.txt                 → Elimina archivo.txt
		rm -r carpeta/                 → Elimina un directorio y su contenido
		rm -rf carpeta/                → Elimina un directorio sin pedir confirmación

	file → Identifica el tipo de archivo.
		file archivo.bin                → Muestra si es texto, ejecutable, etc.

	cat → Muestra el contenido de un archivo.
		cat archivo.txt                → Muestra el contenido completo de archivo.txt

	tree → Muestra estructura de directorios en árbol.
		tree                           → Visualiza carpetas y archivos en forma de árbol

	less / more / head / tail → Lectura de archivos.
		less archivo.txt               → Permite navegar por el archivo de forma interactiva
		more archivo.txt               → Similar a less, avanza una página a la vez
		head archivo.txt               → Muestra las primeras líneas de un archivo
		tail archivo.txt               → Muestra las últimas líneas de un archivo

Permisos y Propiedad

	chmod → Cambia los permisos de archivos/directorios.
		chmod 755 script.sh            → Da permisos completos al dueño y limitados a otros
		chmod u+x script.sh            → Añade permiso de ejecución para el propietario
		chmod go-rwx archivo           → Quita todos los permisos a grupo y otros
		chmod u=r,g=,o= archivo        → Define exactamente qué permisos tiene cada categoría

	chown → Cambia propietario y grupo de archivos/directorios.
		chown usuario:grupo archivo.txt→ Cambia dueño y grupo del archivo

Información del Sistema

	df → Muestra espacio disponible en disco.
		df -h                          → Muestra información en formato humano-legible
	tu → Muestra uso de disco.
		du -sh *                       → Muestra tamaño total de archivos y carpetas

	top / htop → Monitorea procesos y uso de recursos.
		top                            → Monitorea procesos (comando básico)
		htop                           → Versión mejorada y visual del comando top

	ps → Lista procesos en ejecución.
		ps aux                         → Muestra todos los procesos en detalle estilo BSD
		ps -ef                         → Muestra procesos en estilo UNIX, con jerarquía (PPID)
		ps aux | grep apache           → Busca procesos relacionados con apache

	kill → Termina procesos.
		kill 1234                      → Termina el proceso con PID 1234
		kill -9 1234                   → Fuerza la terminación inmediata del proceso

	free / uptime / date → Info de RAM, sistema y hora.
		free -m                        → Muestra memoria disponible en MB
		uptime                         → Muestra el tiempo encendido y carga media
		date                           → Muestra la fecha y hora actual

Historial y Ayuda

	history → Muestra historial de comandos.
		history                        → Lista comandos ejecutados anteriormente

	man → Muestra manual del comando.
		man ls                         → Muestra el manual detallado del comando ls

Red y Descargas

	ping → Verifica conexión a una IP o dominio.
		ping google.com                → Comprueba la conectividad hacia google.com

	traceroute → Muestra ruta hacia destino.
		traceroute google.com          → Muestra el camino hacia google.com

	wget → Descarga archivos desde internet.
		wget https://dominio.com/archivo.zip → Descarga archivo desde URL especificada

Redirecciones y Pipes

	> → Redirecciona la salida sobrescribiendo.
		ls > salida.txt                → Guarda el listado en el archivo (sobrescribe)

	>> → Añade la salida al final del archivo.
		echo "Nueva línea" >> salida.txt

	< → Usa el contenido de un archivo como entrada.
		sort < archivo.txt

	| → Conecta la salida de un comando con otro.
		ls | grep .txt                 → Filtra archivos .txt del listado

Búsqueda y Procesamiento de Texto

	grep → Busca texto dentro de archivos.
		grep -i error archivo.log       → Busca "error" ignorando mayúsculas
		grep -R "firewall" /etc/        → Busca recursivamente la palabra firewall en /etc

	cut → Extrae partes de texto por columnas.
		cut -d: -f1 /etc/passwd         → Muestra los nombres de usuario

	awk → Procesa texto estructurado.
		awk -F: '{print $1, $7}' /etc/passwd → Muestra usuario y shell asignada
		$1, $2, $0                      → Columnas en awk; $0 representa la línea completa

	find → Busca archivos según criterios.
		find / -name "*.log"           → Busca archivos .log desde raíz
		find /etc -type f -size +10M   → Archivos mayores de 10MB en /etc

	sort → Ordena líneas de texto.
		sort archivo.txt               → Ordena el contenido alfabéticamente

	wc → Cuenta líneas, palabras y caracteres.
		wc -l archivo.txt              → Cuenta el número de líneas del archivo

	diff → Compara archivos línea por línea.
		diff archivo1.txt archivo2.txt → Muestra diferencias entre dos archivos

Compresión y Empaquetado

	tar → Empaqueta/desempaqueta archivos.
		tar -czf archivo.tar.gz carpeta/  → Crea archivo comprimido de carpeta/
		tar -xzf archivo.tar.gz           → Extrae contenido del archivo

	zip / unzip → Comprime/descomprime archivos ZIP.
		zip archivo.zip archivo.txt      → Comprime archivo.txt en archivo.zip
		unzip archivo.zip                → Descomprime archivo.zip

Gestión de Paquetes

	yum / dnf (CentOS/RHEL) → Gestión de paquetes.
		yum install paquete             → Instala un paquete en CentOS
		dnf install paquete             → Nueva generación, reemplaza yum

	apt-get / apt (Ubuntu/Debian) → Gestión de paquetes.
		sudo apt-get update             → Actualiza lista de paquetes disponibles
		sudo apt-get install htop       → Instala el programa htop

Gestión de Usuarios y Grupos

	useradd usuario                 → Crea un nuevo usuario
	userdel usuario                 → Elimina un usuario existente
	passwd usuario                  → Cambia contraseña del usuario
	groupadd grupo                  → Crea un nuevo grupo
	groupdel grupo                  → Elimina un grupo
	usermod -aG grupo usuario       → Añade usuario a un grupo existente
	su usuario                      → Cambia a otro usuario
	sudo -i                         → Cambia al usuario root

Alias y Configuraciones

	alias → Crea comandos personalizados.
		alias ll='ls -l'                 → Crea alias para listar en formato largo

	unalias → Elimina alias existentes.
		unalias ll                       → Elimina el alias previamente creado

Otros comandos útiles

	whoami → Muestra el usuario actual
	uptime → Muestra tiempo activo del sistema
	last → Muestra últimos inicios de sesión
	visudo → Edita el archivo de sudoers de forma segura

