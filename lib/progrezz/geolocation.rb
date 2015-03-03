require "progrezz/geolocation_ext"
 
# Módulo de Progrezz.
module Progrezz
  # Módulo de cálculos de geolocalización.
  class Geolocation
    # Unidad por defecto.
    DEFAULT_UNIT = :km

    # Cálculo de distancia entre puntos.
    #
    # * *Argumentos*:
    #   -+point1+: Hash con la forma {latitude: lat1, longitude: lon1}.
    #   -+point2+: Hash con la forma {latitude: lat2, longitude: lon2}.
    #   -+unit+:   Símbolo que define la unidad resultante (:m (meters), :km (kilometers), :miles, :nautic_miles). Por defecto es Progrezz::Geolocation::DEFAULT_UNIT.
    #
    # * *Retorna*:
    #   - Distancia entre *point1* y *point2*, especificada en *unit*.
    def self.distance(point1, point2, unit = nil)
      if unit == nil then unit = DEFAULT_UNIT end

      begin
        distance = case unit
          when :m            then self._distance_m(point1[:latitude], point1[:longitude], point2[:latitude], point2[:longitude])
          when :km           then self._distance_km(point1[:latitude], point1[:longitude], point2[:latitude], point2[:longitude])
          when :miles        then self._distance_miles(point1[:latitude], point1[:longitude], point2[:latitude], point2[:longitude])
          when :nautic_miles then self._distance_nautic_miles(point1[:latitude], point1[:longitude], point2[:latitude], point2[:longitude])
          else               nil
        end
      rescue
        distance = nil
      end

      return distance
    end
      
    # ...

  end
end
