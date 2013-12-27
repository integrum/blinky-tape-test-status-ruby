$:.push File.expand_path("../lib", __FILE__)
require "blinky_tape_test_status/version"

Gem::Specification.new do |s|
  s.name        = 'blinky-tape-test-status'
  s.version     = BlinkyTapeTestStatus::VERSION
  s.summary     = "blinky-tape-test-status"
  s.description = "A Ruby interface for blinky-tape-test-status"
  s.authors     = ["Jade Meskill", "Roy van de Water"]
  s.email       = 'dev@integrumtech.com'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "serialport"

  s.homepage    =
    'http://rubygems.org/gems/blinky-tape-test-status'
  s.license       = 'MIT'
end
