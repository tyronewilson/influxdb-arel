# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'influx_db/arel/version'

Gem::Specification.new do |spec|
  spec.name          = "influx_db-arel"
  spec.version       = InfluxDB::Arel::VERSION
  spec.authors       = ["undr"]
  spec.email         = ["undr@yandex.ru"]
  spec.summary       = %q{InfluxDB SQL AST manager.}
  spec.description   = %q{InfluxDB::Arel is a SQL AST manager for InfluxDB dialect.}
  spec.homepage      = "https://github.com/undr/influx_db-arel"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
