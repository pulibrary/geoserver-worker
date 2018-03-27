module Geoserver
  module Worker
    class EventProcessor
      class Processor
        attr_reader :event
        def initialize(event)
          @event = event
        end

        private

          def event_type
            event['event']
          end

          def id
            event['id']
          end

          def layer_type
            event['layer_type']
          end

          def path
            event['path']
          end

          def title
            event['title']
          end

          def workspace
            event['workspace']
          end
      end
    end
  end
end
