#include <ruby.h>

#include "methods.h"
 
void Init_geolocation_ext() {
  // Define Progrezz module
  VALUE progrezz_module = rb_define_module("Progrezz");

  // Define Geolocation class
  VALUE geolocation = rb_define_class_under(progrezz_module, "Geolocation", rb_cObject);

  // Define static methods for that class, using C methods.
  rb_define_module_function(geolocation, "_distance_m",            geolocation_distance_m,            5);
  rb_define_module_function(geolocation, "_distance_km",           geolocation_distance_km,           5);
  rb_define_module_function(geolocation, "_distance_miles",        geolocation_distance_miles,        5);
  rb_define_module_function(geolocation, "_distance_nautic_miles", geolocation_distance_nautic_miles, 5);
}
