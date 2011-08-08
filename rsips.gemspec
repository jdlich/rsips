# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rsips/version"

Gem::Specification.new do |s|
  s.name        = "rsips"
  s.version     = Rsips::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jacob Lichner"]
  s.email       = ["jacob.d.lichner@gmail.com"]
  s.homepage    = "http://github.com/jdlich/rsips"
  s.summary     = "Ruby wrapper for OS X's `sips` utility."

  s.rubyforge_project = "rsips"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
