module Geoserver
  module Worker
    class EventProcessor
      extend Forwardable
      attr_reader :event

      def initialize(event)
        @event = event
      end

      def_delegators :processor, :process

      private

      def event_type
        event['event']
      end

      def processor
        case event_type
        when 'CREATED'
          CreateProcessor.new(event)
        when 'UPDATED'
          UnknownEvent.new(event)
        when 'DELETED'
          DeleteProcessor.new(event)
        else
          UnknownEvent.new(event)
        end
      end
    end
  end
end
