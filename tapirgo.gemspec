# Encoding: UTF-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tapirgo/version'

Gem::Specification.new do |spec|
  spec.name          = 'tapirgo'
  spec.version       = Tapirgo::VERSION
  spec.authors       = ['Jonathan Hartman']
  spec.email         = ['j@p4nt5.com']
  spec.summary       = %q{A simple Ruby library for the Tapir API}
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/RoboticCheese/tapirgo-ruby'
  spec.license       = 'Apache'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client'

  %w{
    bundler
    rake
    cane
    countloc
    rubocop
    rspec
    simplecov
    simplecov-console
    coveralls
  }.each do |d|
    spec.add_development_dependency d
  end
end

# vim: ai et ts=2 sts=2 sw=2 ft=ruby
