# frozen_string_literal: true
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "geoserver/worker/version"

Gem::Specification.new do |spec|
  spec.name          = "geoserver-worker"
  spec.version       = Geoserver::Worker::VERSION
  spec.authors       = ["Eliot Jordan"]
  spec.email         = ["eliotj@princeton.edu"]

  spec.summary       = "Sneakers worker for syncing with GeoServer using RabbitMQ"
  spec.description   = "Sneakers worker for syncing with GeoServer using RabbitMQ"
  spec.homepage      = "https://github.com/pulibrary/geoserver-worker"
  spec.license       = "Apache-2.0"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "bin"
  spec.executables   = ["geoserver-worker"]
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 1.16"
  spec.add_dependency "geoserver-publish"
  spec.add_dependency "sneakers"

  spec.add_development_dependency "bixby"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov"
end
