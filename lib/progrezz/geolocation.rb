require "progrezz/geolocation_ext"
 
# Módulo de Progrezz.
module Progrezz
  # Módulo de cálculos de geolocalización.
  class Geolocation
    # Unidad por defecto.
    DEFAULT_UNIT = :km
    
    # Radio ecuatorial de la tierra.
    EARTH_EQUATORIAL_RADIUS = 3963.1676

    # Radio polar de la tierra.
    EARTH_POLAR_RADIUS      = 3949.93239

    # Radio del planeta por defecto. ESPECIFICADO EN MILLAS.
    DEFAULT_RADIUS = 3958.75587

    # Cálculo de distancia entre puntos.
    #
    # * *Argumentos*:
    #   - +point1+: Hash con la forma {latitude: lat1, longitude: lon1}.
    #   - +point2+: Hash con la forma {latitude: lat2, longitude: lon2}.
    #   - +unit+:   Símbolo que define la unidad resultante (:m (meters), :km (kilometers), :miles, :nautic_miles). Por defecto es Progrezz::Geolocation::DEFAULT_UNIT.
    #   - +radius+: Radio del planeta para computar la distancia. Por defecto es DEFAULT_RADIUS, especificado en millas.
    #
    # * *Retorna*:
    #   - Distancia entre *point1* y *point2*, especificada en *unit*.
    def self.distance(point1, point2, unit = nil, radius = nil)
      # Valores por defecto.
      if unit == nil then unit = DEFAULT_UNIT end
      if radius == nil then radius = DEFAULT_RADIUS end

      begin
        distance = case unit
          when :m            then self._distance_m(point1[:latitude].to_f, point1[:longitude].to_f, point2[:latitude].to_f, point2[:longitude].to_f, radius.to_f)
          when :km           then self._distance_km(point1[:latitude].to_f, point1[:longitude].to_f, point2[:latitude].to_f, point2[:longitude].to_f, radius.to_f)
          when :miles        then self._distance_miles(point1[:latitude].to_f, point1[:longitude].to_f, point2[:latitude].to_f, point2[:longitude].to_f, radius.to_f)
          when :nautic_miles then self._distance_nautic_miles(point1[:latitude].to_f, point1[:longitude].to_f, point2[:latitude].to_f, point2[:longitude].to_f, radius.to_f)
          else               nil
        end
      rescue
        distance = nil
      end

      return distance
    end

    # Convertir distancia a millas.
    #
    # * *Argumentos*:
    #   - +distance+: Distancia a convertir.
    #   - +current_unit+: Unidad de distancia actual (:km, :m, :miles, :nautic_miles)
    #
    # * *Retorna*:
    #   - Distancia convertida.
    def self.distance_to_miles(distance, current_unit)
       return case unit
         when :km then 0.621371192 * distance
         when :m  then 0.000621371192 * distance
         when :nautic_miles then 1.15077945 * distance
         else distance
      end
    end

    # Convertir millas a otra unidad.
    #
    # * *Argumentos*:
    #   - +distance+: Distancia a convertir.
    #   - +unit+: Unidad de distancia actual (:km, :m, :miles, :nautic_miles)
    #
    # * *Retorna*:
    #   - Distancia convertida.
    def self.convert_miles(distance, unit)
      return case unit
        when :km then 1.609344 * distance
        when :m  then 1609.344 * distance
        when :nautic_miles then 0.8684 * distance
        else distance
      end
    end
      
    # Convertir grados de latitud a una unidad de distancia.
    #
    # * *Argumentos*:
    #   - +latitude_deg+: Latitud a convertir.
    #   - +unit+: Unidad de distancia deseada (:km, :m, :miles, :nautic_miles). Por defecto usa DEFAULT_UNIT.
    #   - +radius+: Radio de la esfera. Por defecto es EARTH_POLAR_RADIUS.
    #
    # * *Retorna*:
    #   - Distancia convertida.
    def self.earth_latitude_to_distance (latitude_deg, unit = nil, radius = nil)
      if unit == nil then unit = DEFAULT_UNIT end
      if radius == nil then radius = EARTH_POLAR_RADIUS end

      distance = ( (2 * Math::PI * radius / 2) / 180.0 ) * latitude_deg
      return convert_miles( distance, unit )
    end

    # Convertir grados de longitud a una unidad de distancia.
    #
    # * *Argumentos*:
    #   - +longitude_deg+: Longitud a convertir.
    #   - +unit+: Unidad de distancia deseada (:km, :m, :miles, :nautic_miles). Por defecto usa DEFAULT_UNIT.
    #   - +radius+: Radio de la esfera. Por defecto es EARTH_POLAR_RADIUS.
    #
    # * *Retorna*:
    #   - Distancia convertida.
    def self.earth_longitude_to_distance (longitude_deg, unit = nil, radius = nil)
      if unit == nil then unit = DEFAULT_UNIT end
      if radius == nil then radius = EARTH_EQUATORIAL_RADIUS end

      distance = ( 2 * Math::PI * radius / 360.0 ) * longitude_deg
      return convert_miles( distance, unit )
    end

  end
end
