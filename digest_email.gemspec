# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'digest_email/version'

Gem::Specification.new do |gem|
  gem.name          = "digest_email"
  gem.version       = DigestEmail::VERSION
  gem.authors       = ["Peter Hamilton"]
  gem.email         = ["peter@inspiredpixel.net"]
  gem.description   = %q{Gem to generate a weekly email digest}
  gem.summary       = %q{Gem to generate a weekly email digest}
  gem.homepage      = ""

  gem.files         = Dir["{lib}/**/*", "{templates}/**/*", "{bin}/**/*"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
