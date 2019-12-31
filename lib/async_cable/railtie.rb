# frozen_string_literal: true

module AsyncCable
  class Railtie < ::Rails::Railtie
    initializer "async_cable.helpers" do
      ActiveSupport.on_load(:action_view) do
        include ActionCable::Helpers::ActionCableHelper
      end
    end
  end
end
