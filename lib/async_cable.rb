# frozen_string_literal: true

require "async"
require "async/semaphore"
require "async_cable/railtie"
require "async_cable/patch"
require "async_cable/worker"

module AsyncCable
  autoload :Version, "async_cable/version"
end
