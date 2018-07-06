# frozen_string_literal: true
module Geoserver
  module Worker
    class EventProcessor
      class UpdateProcessor < Processor
        def create_method
          return :geotiff if layer_type == "geotiff"
          return :shapefile if layer_type == "shapefile"
        end

        def create_params
          {
            workspace_name: workspace,
            file_path: path,
            id: id,
            title: title
          }
        end

        def delete_method
          return :delete_geotiff if layer_type == "geotiff"
          return :delete_shapefile if layer_type == "shapefile"
        end

        def delete_params
          {
            workspace_name: workspace,
            id: id
          }
        end

        def process
          return false unless create_method
          Geoserver::Publish.send(delete_method, delete_params)
          Geoserver::Publish.send(create_method, create_params)
          true
        rescue StandardError
          false
        end
      end
    end
  end
end
