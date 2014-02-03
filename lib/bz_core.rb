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
end

begin
  ActiveSupport.on_load(:action_controller) do
    include BzCore::FlashMessages
  end
rescue LoadError
  puts "Rails not installed, continuing"
end