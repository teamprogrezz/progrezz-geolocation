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

Una vez instalada la gema, puede acceder a las funcionalidades de la misma usando la clase o contenedor ````Progrez::Geolocation```` de manera sencilla:

#### Distancia esférica ####
````
# main.rb
p1 = {latitude:  38.898556, longitude: -77.037852}
p2 = {latitude:  38.897147, longitude: -77.043934}

puts "P1: " + p1[:latitude].to_s + ", " + p1[:longitude].to_s
puts "P2: " + p2[:latitude].to_s + ", " + p2[:longitude].to_s

# Distancia en la tierra
puts "  Tierra:"
puts "Distancia (m):            " + Progrezz::Geolocation.distance(p1, p2, :m).to_s
puts "Distancia (km):           " + Progrezz::Geolocation.distance(p1, p2, :km).to_s
puts "Distancia (miles):        " + Progrezz::Geolocation.distance(p1, p2, :miles).to_s
puts "Distancia (nautic_miles): " + Progrezz::Geolocation.distance(p1, p2, :nautic_miles).to_s

# Distancia en marte
mars_radius = 2106.13766
puts "\n  Marte:"
puts "Distancia (m):            " + Progrezz::Geolocation.distance(p1, p2, :m, mars_radius).to_s
puts "Distancia (km):           " + Progrezz::Geolocation.distance(p1, p2, :km, mars_radius).to_s
puts "Distancia (miles):        " + Progrezz::Geolocation.distance(p1, p2, :miles, mars_radius).to_s
puts "Distancia (nautic_miles): " + Progrezz::Geolocation.distance(p1, p2, :nautic_miles, mars_radius).to_s

````

## 4. Dependencias ##

- La librería requiere del entorno Ruby para construir la gema con las respectivas extensiones.

