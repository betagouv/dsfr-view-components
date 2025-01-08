# frozen_string_literal: true

module Dsfr
  class Engine < ::Rails::Railtie
    initializer 'dsfr-view-components.assets.paths' do |app|
      app.config.assets.paths << File.expand_path('../../vendor/assets/stylesheets', __dir__)
      app.config.assets.paths << File.expand_path('../../vendor/assets/javascripts', __dir__)
    end
  end
end
