#include <ruby.h>

#include <math.h>
#define _USE_MATH_DEFINES

// Privados, usados por Geolocation
double deg_to_rad(double d) {
  return d * M_PI / 180;
}
double rad_to_deg(double r) {
  return r * 180 / M_PI;
}

static inline double distance_milles(VALUE lat1, VALUE lon1, VALUE lat2, VALUE lon2) {
  double latitude1, longitude1, latitude2, longitude2;
  double theta, dist;

  latitude1  = NUM2DBL(lat1);
  longitude1 = NUM2DBL(lon1);
  latitude2  = NUM2DBL(lat2);
  longitude2 = NUM2DBL(lon2);

  if(latitude1 == latitude2 && longitude1 == longitude2)
    return 0;

  theta = longitude1 - longitude2;
  dist = sin(deg_to_rad(latitude1)) * sin(deg_to_rad(latitude2)) + cos(deg_to_rad(latitude1)) * cos(deg_to_rad(latitude2)) * cos(deg_to_rad(theta));

  return dist;
}

static VALUE geolocation_distance_miles(VALUE rb_class, VALUE lat1, VALUE lon1, VALUE lat2, VALUE lon2) {
  return rb_float_new( distance_milles( lat1, lon1, lat2, lon2 ) );
}

static VALUE geolocation_distance_m(VALUE rb_class, VALUE lat1, VALUE lon1, VALUE lat2, VALUE lon2) {
  return rb_float_new( distance_milles( lat1, lon1, lat2, lon2 ) * 1609.344);
}

static VALUE geolocation_distance_km(VALUE rb_class, VALUE lat1, VALUE lon1, VALUE lat2, VALUE lon2) {
  return rb_float_new( distance_milles( lat1, lon1, lat2, lon2 ) * 1.609344);
}

static VALUE geolocation_distance_nautic_miles(VALUE rb_class, VALUE lat1, VALUE lon1, VALUE lat2, VALUE lon2) {
  return rb_float_new( distance_milles( lat1, lon1, lat2, lon2 ) * 0.8684);
}
