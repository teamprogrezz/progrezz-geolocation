#include <ruby.h>

#include "methods.h"
 
void Init_geolocation_ext() {
  // Define Progrezz module
  VALUE progrezz_module = rb_define_module("Progrezz");

  // Define Geolocation class
  VALUE geolocation = rb_define_class_under(progrezz_module, "Geolocation", rb_cObject);

  // Define static methods for that class, using C methods.
  rb_define_module_function(geolocation, "echo", geolocation_echo, 1);
  // rb_define_private_method(geolocation, "_echo", geolocation_echo, 1);
}
