# frozen_string_literal: true
module Geoserver
  module Worker
    def config
      @config ||= config_yaml
    end

    private

      def config_yaml
        file_path = File.join(Geoserver::Worker.root, "config", "config.yml")
        YAML.safe_load(ERB.new(File.read(file_path)).result, [], [], true)
      end

      module_function :config, :config_yaml
  end
end
