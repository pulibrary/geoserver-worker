# frozen_string_literal: true
module Geoserver
  module Worker
    class EventHandler
      include Sneakers::Worker
      from_queue :geoserver

      def work(msg)
        msg = JSON.parse(msg)
        result = Worker::EventProcessor.new(msg).process
        if result
          ack!
        else
          reject!
        end
      end
    end
  end
end
