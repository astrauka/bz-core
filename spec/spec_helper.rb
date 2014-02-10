require "capybara/poltergeist"
Capybara.javascript_driver = :poltergeist

# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require "rspec/rails"
require "devise"

Rails.backtrace_cleaner.remove_silencers!

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

RSpec.configure do |config|
  config.order = "random"

  config.include Devise::TestHelpers, type: :controller

  config.include BzCore::AuthenticationMacros, type: :feature
  config.include BzCore::ClickOnHelper, type: :feature
  config.include BzCore::ExpectationHelpers, type: :feature
  config.include BzCore::FeaturesHelpers, type: :feature
  config.include BzCore::ModalHelper, type: :feature
end
