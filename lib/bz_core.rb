require "bz_core/engine"
require "slim-rails"

require "sass-rails"
require "coffee-rails"
require "execjs"
require "uglifier"

require "bootstrap-sass"
require "jquery-rails"
require "jquery-ui-rails"
require "bootstrap-datepicker-rails"
require "select2-rails"

require "draper"
require "decent_exposure"

require "dotenv-rails"

require "#{BzCore::Engine.root}/lib/flash_messages.rb"

module BzCore
  %w(
    authentication_helper
    click_on_helper
    expectation_helper
    features_helper
    modal_helper
    spec_utility
  ).each do |module_name|
    autoload module_name.classify.to_sym, "bz_core/spec/support/#{module_name}"
  end
end

begin
  ActiveSupport.on_load(:action_controller) do
    include BzCore::FlashMessages
  end
rescue LoadError
  puts "Rails not installed, continuing"
end
