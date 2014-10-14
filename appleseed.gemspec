# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "appleseed"
  spec.version       = "0.0.1"
  spec.authors       = ["Josh Simpson"]
  spec.email         = ["jsimpson@instructure.com"]
  spec.summary       = %q{Appleseed}
  spec.description   = "Seed canvas-lms with realistic user data."
  spec.homepage      = "http://www.instructure.com/"
  spec.license       = "MIT"

  spec.files         = Dir.glob("{lib,spec}/**/*")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "pandarus", "~> 0.4"
  spec.add_dependency "activesupport", "~> 4.1"
  spec.add_dependency "faker", "~> 1.4"
  spec.add_dependency "colorize", "~> 0.7"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug", "~> 3.4"
end
