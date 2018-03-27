module Geoserver
  module Worker
    class EventProcessor
      class DeleteProcessor < Processor
        def params
          {
            workspace_name: workspace,
            id: id
          }
        end

        def publish_method
          return :delete_geotiff if layer_type == "geotiff"
          return :delete_shapefile if layer_type == "shapefile"
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
