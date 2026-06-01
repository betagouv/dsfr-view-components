require "rails/engine"

module Dsfr
  module Components
    class Engine < ::Rails::Engine
      isolate_namespace Dsfr::Components
    end
  end
end

Dir[Dsfr::Components::Engine.root.join("app", "helpers", "*.rb")].sort.each { |f| require f }
