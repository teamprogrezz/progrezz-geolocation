#include <ruby.h>

static VALUE geolocation_echo(VALUE rb_class, VALUE string) {
  printf("Hello, %s\n", StringValuePtr( string ));

  return Qnil;
}

