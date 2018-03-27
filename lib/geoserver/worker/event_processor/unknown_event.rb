# frozen_string_literal: true
module Geoserver
  module Worker
    class EventProcessor
      class UnknownEvent < Processor
        attr_reader :event
        def initialize(event)
          @event = event
        end

        def process
          false
        end
      end
    end
  end
end
