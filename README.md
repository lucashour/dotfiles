# dotfiles
### Scripts de instalación y archivos de configuración del sistema y de diferentes herramientas###

Este repositorio tiene la finalidad de agilizar la instalación de herramientas y programas básicos de un sistema Ubuntu 64 bits, así como también de sincronizar los archivos de configuración de Bash, Zsh y Vim.

> ### set_up.sh

Para correr el script de instalación con sólo un comando, ejecutar la siguiente sentencia desde la línea de comandos:

```$ wget -O - https://raw.githubusercontent.com/lucashour/dotfiles/master/set_up.sh | bash```

El script instala diversos programas juntos a sus dependencias, y descarga los archivos de configuración de Bash, Zsh y Vim. Configura, además, a Zsh como shell por defecto.

Programas instalados:

- Git, git-flow.
- Curl
- Wget
- NodeJS
- NPM
- LibMagic-dev
- Ack-Grep
- OpenSSH-Server
- Ubuntun restricted extras (media codecs)
- Google Chrome
- VLC Player
- Spotify
- Rbenv y Ruby 2.3.0
- Apache 2
- MySQL
- PHP y PHP-Cli
- Zsh
- Oh-My-Zsh
