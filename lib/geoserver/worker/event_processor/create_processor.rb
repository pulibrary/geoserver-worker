# frozen_string_literal: true
module Geoserver
  module Worker
    class EventProcessor
      class CreateProcessor < Processor
        def params
          {
            workspace_name: workspace,
            file_path: path,
            id: id,
            title: title
          }
        end

        def publish_method
          return :geotiff if layer_type == "geotiff"
          return :shapefile if layer_type == "shapefile"
        end

        def process
          return false unless publish_method
          Geoserver::Publish.send(publish_method, params)
          true
        rescue StandardError
          false
        end
      end
    end
  end
end
