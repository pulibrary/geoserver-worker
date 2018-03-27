# frozen_string_literal: true
require "erb"
require "json"
require "yaml"
require "sneakers"
require "geoserver/publish"

module Geoserver
  module Worker
    require "geoserver/worker/config"
    require "geoserver/worker/event_handler"
    require "geoserver/worker/event_processor"
    require "geoserver/worker/event_processor/processor"
    require "geoserver/worker/event_processor/create_processor"
    require "geoserver/worker/event_processor/delete_processor"
    require "geoserver/worker/event_processor/unknown_event"

    class Error < StandardError
    end
  end
end
