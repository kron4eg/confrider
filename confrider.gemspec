# -*- encoding: utf-8 -*-
require File.expand_path('../lib/confrider/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Artiom Di']
  gem.email         = ['kron82@gmail.com']
  gem.summary       = %q{manage config options like i18n}
  gem.description   = %q{}
  gem.homepage      = 'https://github.com/kron4eg/confrider'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'confrider'
  gem.require_paths = ['lib']
  gem.version       = Confrider::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end
