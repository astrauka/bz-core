$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "foundation/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "foundation"
  s.version     = Foundation::VERSION
  s.authors     = ["Bit Zesty"]
  s.email       = ["info@bitzesty.com"]
  s.homepage    = "http://bitzesty.com/"
  s.summary     = "Commonly used project foundation"
  s.description = "Commonly used project foundation"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.2"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
