# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "copper/version"

Gem::Specification.new do |spec|
  spec.name          = "copper"
  spec.version       = Copper::VERSION
  spec.authors       = ["Neeraj Chandra", "David Lesches"]
  spec.email         = ["nchandra324@gmail.com", "david@recurroo.com"]

  spec.summary       = %q{A Ruby gem for the Copper Developer API}
  spec.description   = %q{A lightweight interface for the Copper Developer API}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
