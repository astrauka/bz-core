$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bz_core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bz-core"
  s.version     = BzCore::VERSION
  s.authors     = ["Bit Zesty"]
  s.email       = ["info@bitzesty.com"]
  s.homepage    = "http://bitzesty.com/"
  s.summary     = "Commonly used project core"
  s.description = "Commonly used project core"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency "slim-rails", "~> 2.0.4"

  s.add_dependency "sass-rails", "~> 4.0.0"
  s.add_dependency "coffee-rails", "~> 4.0.0"
  s.add_dependency "uglifier", ">= 1.3.0"
  s.add_dependency "execjs"

  s.add_dependency "bootstrap-sass", ">= 3.0.0.0"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"
  s.add_dependency "bootstrap-datepicker-rails"
  s.add_dependency "select2-rails"
  s.add_dependency "kaminari"

  s.add_dependency "draper"
  s.add_dependency "decent_exposure", "~>2.3.0"

  s.add_dependency "dotenv-rails"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "poltergeist"
end
