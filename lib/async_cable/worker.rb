# frozen_string_literal: true

module AsyncCable
  # Replacement of ActionCable::Server::Worker
  class Worker < ActionCable::Server::Worker
    def initialize(max_size: 1_000)
      @queue = Queue.new
      @max_size = max_size
      @executor = Thread.new { run }
    end

    # @override
    def halt
      @executor.kill
    end

    # @override
    def stopping?
      !@executor
    end

    # @override
    def async_invoke(receiver, method, *args, connection: receiver, &block)
      @queue << lambda do
        invoke(receiver, method, *args, connection: connection, &block)
      end
    end

    private
      def run
        Async do
          semaphore = Async::Semaphore.new(@max_size)
          loop do
            todo = @queue.pop
            semaphore.async { todo.call }
          end
        end
      end
  end
end
