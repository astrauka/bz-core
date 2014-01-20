module BzCore
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.template_engine :slim
      g.test_framework :rspec,
                       fixture: true,
                       routing_specs: false,
                       helper_specs: false,
                       request_specs: false,
                       decorator_specs: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.view_specs false
      g.helper_specs false
      g.controller_specs false
      g.jbuilder false
      g.decorator false
      g.stylesheets false
      g.assets false
      g.helper false
      g.javascripts false
    end

    config.assets.precompile += %w(
      application.css
      application-ie8.css
      application-ie7.css
      application-ie6.css
      application.js
    )
  end
end
