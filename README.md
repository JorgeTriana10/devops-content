# DevOps Course Content

Repositorio personal con el contenido que estoy trabajando durante un curso completo de DevOps.  
Aquí organizo por módulos toda la práctica que voy haciendo: comandos, scripts, configuraciones y archivos de automatización.

El objetivo es tener un repositorio estructurado que pueda servir como referencia, documentación y ejemplos prácticos.

---

## Estructura del repositorio

### Linux

.
|-- AWS
|   `-- AWS-Part 1
|       |-- AWSSlides.pdf
|       |-- Servicios AWS.pdf
|       |-- project-vprofile-v1
|       |   |-- docs
|       |   |   |-- 01-introduction.md
|       |   |   |-- 02-security-groups-and-keypairs.md
|       |   |   |-- 03-ec2-instances.md
|       |   |   |-- 04-route53-private-dns.md
|       |   |   |-- 05-ALB&DNS.md
|       |   |   |-- 06-build & deploy.md
|       |   |   |-- 07-AutoScalingGroup.md
|       |   |   `-- arquitectura.png
|       |   `-- scripts
|       |       |-- memcache.sh
|       |       |-- mysql.sh
|       |       |-- rabbitmq.sh
|       |       `-- tomcat_ubuntu.sh
|       `-- project-vprofile-v2
|           |-- 01-introduction.md
|           |-- 02-security-groups-y-keypairs.md
|           |-- 03-rds.md
|           |-- 04-elasticache-memcached.md
|           |-- 05-amazon-mq-rabbitmq.md
|           |-- 06-inicializacion-bd-rds.md
|           |-- 07-elastic-beanstalk.md
|           |-- 08-build-and-deploy-artifact.md
|           |-- 09-cloudfront.md
|           `-- arquitectura-v2.png
|-- README.md
|-- bash
|   |-- Bash Content
|   |   |-- bash_basics.md
|   |   |-- cli_args.md
|   |   |-- conditionals.md
|   |   |-- io_redirection.md
|   |   |-- loops.md
|   |   `-- variables.md
|   |-- Project
|   |   |-- README.md
|   |   |-- multios_websetup.sh
|   |   |-- remhosts
|   |   `-- webdeploy.sh
|   |-- log
|   |   |-- 01_script (timestamp + nivel).sh
|   |   |-- 02_script (color filter)
|   |   `-- Log Funtion.md
|   `-- scripts
|       |-- 01_firstscript.sh
|       |-- 02_websetup.sh
|       |-- 03_vars_websetup.sh
|       |-- 04_args.sh
|       |-- 05_args_websetup.sh
|       |-- 06_command_subs.sh
|       |-- 07_userInput.sh
|       |-- 08_if1.sh
|       |-- 09_if1.sh
|       |-- 10_ifelif.sh
|       |-- 11_monit.sh
|       |-- 12_monit.sh
|       |-- 13_for.sh
|       |-- 14_for.sh
|       |-- 15_while.sh
|       |-- 16_while.sh
|       |-- dismantle.sh
|       |-- remote_websetup
|       |   |-- multios_websetup.sh
|       |   |-- remhosts
|       |   |-- testfile.txt
|       |   `-- webdeploy.sh
|       `-- testvars.sh
`-- linux
    |-- commands.md
    |-- networking
    |   `-- networking-commands.md
    |-- server-management
    |   |-- permissions.md
    |   |-- services.md
    |   `-- users.md
    `-- vagrant
        |-- Vagrantfile
        |-- provision.sh
        `-- vagrant-commands.md





---

## ¿Por qué este repositorio?

- Practicar conceptos clave de DevOps desde cero
- Documentar ejemplos reales y comandos útiles
- Crear una referencia reutilizable y fácilmente navegable
- Mostrar de forma clara lo aprendido en el curso

---

## Sobre el curso

Este contenido está basado en el curso “DevOps Beginners to Advanced with Projects” (Imran Teli, Udemy), e irá creciendo a medida que avance por los módulos de Bash scripting, Git, CI/CD, Ansible, Docker, Kubernetes, Terraform y despliegue de proyectos reales.

---

## Próximos pasos
- CI/CD
- Automatización de builds con Jenkins y Maven
- Infraestructura como código con Ansible y Terraform
- Contenedores con Docker y Kubernetes
- Proyectos de integración real

---
