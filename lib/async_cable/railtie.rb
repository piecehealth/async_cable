# frozen_string_literal: true

module AsyncCable
  class Railtie < ::Rails::Railtie
    initializer "async_cable.append_path" do
      ActiveSupport.on_load(:action_cable) do
        extend AsyncCable::ConfigurationPatch
      end
    end
  end
end
