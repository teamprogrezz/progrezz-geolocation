# Módulo Ruby de geolocalización #

## 1. Introducción ##
Librería o módulo sencillo escrito en Ruby, junto con una extensión en *C* (nativo), usado para realizar cálculos de manera rápida y eficiente.

## 2. Instalación ##
Primero, descargue el repositorio:

    $ git clone https://github.com/teamprogrezz/progrezz-geolocation.git

Posteriormente, construya la gema:

    $ gem build progrezz.geolocation.gemspec

Finalmente, instale la gema generada (tenga en cuenta la versión):

    $ gem install progrezz-geolocation-x.y.gem

Si usa bundle para gestionar las dependencias, utilice la siguinte línea en el *Gemfile*:

    # Gemfile
    gem 'progrezz-geolocation', :git => 'https://github.com/teamprogrezz/progrezz-geolocation.git'

En caso de usar *Windows* o *Mac OS*, asegúrese de tener las herramientas nativas de Ruby para instalar la gema sin problemas.

## 3. Uso ##
...

## 4. Dependencias ##

- La librería requiere del entorno Ruby para construir la gema con las respectivas extensiones.

