Gem::Specification.new do |spec|
  spec.name = 'progrezz-geolocation'
  spec.version = '0.4'
  spec.summary = 'Geolocalized gem.'
  spec.description = 'Library for ruby, used for the geolocalized server module.'
  spec.email = 'proyecto.progrezz@gmail.com'
  spec.homepage = 'http://progrezz.it'
  spec.author = 'Daniel Herzog Cruz'
  spec.bindir = 'bin'
  spec.licenses = ['MIT']
  spec.executable = 'exec.rb'
  spec.files = Dir['lib/**/*.rb'] + Dir['bin/*'] + Dir['ext/**/*.h'] + Dir['ext/**/*.c'] + Dir['ext/**/extconf.rb']
  spec.platform = Gem::Platform::RUBY # This is the default
  spec.require_paths = [ 'lib', 'ext' ]
  spec.extensions = Dir['ext/**/extconf.rb']
end
