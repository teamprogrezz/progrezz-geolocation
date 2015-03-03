#include <ruby.h>
 
static VALUE method_echo_world(VALUE rb_self) {
  printf("Hi world!\n");

  return Qnil;
}
 
void Init_geolocation_ext() {
  rb_define_method(rb_cObject, "echo_world", method_echo_world, 0);
}
