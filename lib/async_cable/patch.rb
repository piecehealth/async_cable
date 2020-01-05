# frozen_string_literal: true

module AsyncCable
  module ServerPatch
    # @override
    def worker_pool
      @worker_pool || @mutex.synchronize do
        @worker_pool ||= AsyncCable::Worker.new(max_size: config.async_worker_pool_size)
      end
    end
  end

  module ConfigurationPatch
    def self.extended(config_instance)
      class << config_instance
        attr_writer :async_worker_pool_size

        def async_worker_pool_size
          @async_worker_pool_size ||= 1_000
        end
      end

      ActionCable::Server::Base.prepend(ServerPatch)
    end
  end
end
