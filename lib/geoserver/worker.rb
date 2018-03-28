# frozen_string_literal: true
require "erb"
require "geoserver/publish"
require "json"
require "sneakers"
require "yaml"

module Geoserver
  module Worker
    require "geoserver/worker/config"
    require "geoserver/worker/event_handler"
    require "geoserver/worker/event_processor"
    require "geoserver/worker/event_processor/processor"
    require "geoserver/worker/event_processor/create_processor"
    require "geoserver/worker/event_processor/delete_processor"
    require "geoserver/worker/event_processor/unknown_event"

    def self.root
      Pathname.new(File.expand_path("../../../", __FILE__))
    end
  end
end
