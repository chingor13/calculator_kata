# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string_calculator/version'

Gem::Specification.new do |spec|
  spec.name          = "string_calculator"
  spec.version       = StringCalculator::VERSION
  spec.authors       = ["Jeff Ching"]
  spec.email         = ["jching@avvo.com"]
  spec.summary       = %q{String Calculator Kata}
  spec.description   = %q{String Calculator Kata: http://osherove.com/tdd-kata-1/}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
