require "progrezz/geolocation_ext"
 
# Módulo de Progrezz.
module Progrezz
  # Módulo de cálculos de geolocalización.
  class Geolocation
    # Unidad por defecto.
    DEFAULT_UNIT = :km

    # Radio del planeta por defecto. ESPECIFICADO EN MILLAS.
    DEFAULT_RADIUS = 3958.75587

    # Cálculo de distancia entre puntos.
    #
    # * *Argumentos*:
    #   -+point1+: Hash con la forma {latitude: lat1, longitude: lon1}.
    #   -+point2+: Hash con la forma {latitude: lat2, longitude: lon2}.
    #   -+unit+:   Símbolo que define la unidad resultante (:m (meters), :km (kilometers), :miles, :nautic_miles). Por defecto es Progrezz::Geolocation::DEFAULT_UNIT.
    #   -+radius+: Radio del planeta para computar la distancia. Por defecto es DEFAULT_RADIUS, especificado en millas.
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
      
    # ...

  end
end
