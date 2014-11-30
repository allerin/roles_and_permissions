# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roles_and_permissions/version'

Gem::Specification.new do |spec|
  spec.name          = 'roles_and_permissions'
  spec.version       = RolesAndPermissions::VERSION
  spec.authors       = ['Anand Bait']
  spec.email         = ['anand.bait@allerin.com']
  spec.summary       = %q{This is a gem that provides interface based role and user specific permissions.}
  spec.description   = %q{This is a gem that provides interface based role and user specific permissions.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
