# dotfiles
### Scripts de instalación y archivos de configuración del sistema y de diferentes herramientas

Este repositorio tiene la finalidad de agilizar la instalación de herramientas y programas básicos de un sistema Ubuntu 64 bits, así como también de sincronizar los archivos de configuración de Bash, Zsh y Vim.

> ### setup.sh

Para correr el script de instalación con sólo un comando, ejecutar la siguiente sentencia desde la línea de comandos:

```$ wget -O - https://raw.githubusercontent.com/lucashour/dotfiles/main/setup.sh | bash```

El script instala diversos programas juntos a sus dependencias, y descarga los archivos de configuración de Bash, Zsh y Vim. Configura, además, a Zsh como shell por defecto.

Programas instalados:

- Git, git-flow.
- Curl
- Wget
- LibMagic-dev
- Ack-Grep
- OpenSSH-Server
- Ubuntu restricted extras (media codecs)
- VLC Player
- rbenv y Ruby 2.7.4
- nvm
- Zsh
- Oh-My-Zsh
