require "#{BzCore::Engine.root}/lib/flash_messages.rb"
ApplicationController.send(:include, FlashMessages)