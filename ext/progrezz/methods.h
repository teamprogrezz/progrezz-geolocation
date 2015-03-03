#include <ruby.h>
#include <stdio.h>
#include <math.h>
#define _USE_MATH_DEFINES

const double EARTH_RADIUS = 3958.75587;
const double MILES_TO_METERS = 1609.344;
const double MILES_TO_KM = 1.609344;
const double MILES_TO_NAUTIC_MILES = 0.8684;

const double DEGREES_TO_RADIANS = M_PI / 180;
const double RADIANS_TO_DEGREES = 180 / M_PI;


static inline double distance_milles(VALUE lat1, VALUE lon1, VALUE lat2, VALUE lon2, VALUE radius) {
  double latitude1, longitude1, latitude2, longitude2;
  double theta1, theta2;
  double phi1, phi2;
  double dist;
  double planet_radius;

  latitude1  = NUM2DBL(lat1);
  longitude1 = NUM2DBL(lon1);
  latitude2  = NUM2DBL(lat2);
  longitude2 = NUM2DBL(lon2);
  
  planet_radius = NUM2DBL(radius);

  // Si son iguales, ignorar.
  if(latitude1 == latitude2 && longitude1 == longitude2)
    return 0;

  // phi = 90 - latitude
  phi1 = (90.0 - latitude1)*DEGREES_TO_RADIANS;
  phi2 = (90.0 - latitude2)*DEGREES_TO_RADIANS;
       
  // theta = longitude
  theta1 = longitude1 * DEGREES_TO_RADIANS;
  theta2 = longitude2 * DEGREES_TO_RADIANS;

  // Computar la distancia esférica entre las coordinadas con la fórmula siguiente.
  dist = (sin(phi1) * sin(phi2) * cos(theta1 - theta2) + cos(phi1) * cos(phi2));
  // Finalmente, calcular la distancia en la tierra.
  return acos( dist ) * planet_radius;
}

static VALUE geolocation_distance_miles(VALUE rb_class, VALUE lat1, VALUE lon1, VALUE lat2, VALUE lon2, VALUE radius) {
  return rb_float_new( distance_milles( lat1, lon1, lat2, lon2, radius ) );
}

static VALUE geolocation_distance_m(VALUE rb_class, VALUE lat1, VALUE lon1, VALUE lat2, VALUE lon2, VALUE radius) {
  return rb_float_new( distance_milles( lat1, lon1, lat2, lon2, radius ) * MILES_TO_METERS);
}

static VALUE geolocation_distance_km(VALUE rb_class, VALUE lat1, VALUE lon1, VALUE lat2, VALUE lon2, VALUE radius) {
  return rb_float_new( distance_milles( lat1, lon1, lat2, lon2, radius ) * MILES_TO_KM);
}

static VALUE geolocation_distance_nautic_miles(VALUE rb_class, VALUE lat1, VALUE lon1, VALUE lat2, VALUE lon2, VALUE radius) {
  return rb_float_new( distance_milles( lat1, lon1, lat2, lon2, radius ) * MILES_TO_NAUTIC_MILES);
}
