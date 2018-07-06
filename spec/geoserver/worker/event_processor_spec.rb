# frozen_string_literal: true
require "spec_helper"

RSpec.describe Geoserver::Worker::EventProcessor do
  subject(:processor) { described_class.new(event) }
  let(:id) { "c2d14b8-0563c4a18b8a-2d0ae0d91-8b66" }
  let(:layer_type) { "geotiff" }
  let(:title) { "Title" }
  let(:workspace) { "Public" }
  let(:path) { "file:///dataset" }
  let(:event) do
    {
      "event" => event_type,
      "id" => id,
      "layer_type" => layer_type,
      "workspace" => workspace,
      "path" => path,
      "title" => title
    }
  end

  context "when given an unknown event" do
    let(:event_type) { "UNKNOWNEVENT" }
    it "returns false" do
      expect(processor.process).to eq false
    end
  end

  context "when given a shapefile creation event" do
    let(:event_type) { "CREATED" }
    let(:layer_type) { "shapefile" }

    before do
      allow(Geoserver::Publish).to receive(:shapefile)
    end

    it "creates a GeoServer layer" do
      expect(processor.process).to eq true
      expect(Geoserver::Publish).to have_received(:shapefile)
    end
  end

  context "when given a geotiff creation event that causes an error" do
    let(:event_type) { "CREATED" }
    let(:path) { nil }

    before do
      allow(Geoserver::Publish).to receive(:geotiff).and_raise(Geoserver::Publish::Error)
    end

    it "returns false" do
      expect(processor.process).to eq false
    end
  end

  context "when given an update event" do
    let(:event_type) { "UPDATED" }
    let(:layer_type) { "shapefile" }

    before do
      allow(Geoserver::Publish).to receive(:delete_shapefile)
      allow(Geoserver::Publish).to receive(:shapefile)
    end

    it "recreates the shapefile layer in GeoServer" do
      expect(processor.process).to eq true
      expect(Geoserver::Publish).to have_received(:delete_shapefile)
      expect(Geoserver::Publish).to have_received(:shapefile)
    end
  end

  context "when given an update event that causes an error" do
    let(:event_type) { "UPDATED" }
    let(:path) { nil }

    before do
      allow(Geoserver::Publish).to receive(:geotiff).and_raise(Geoserver::Publish::Error)
    end

    it "returns false" do
      expect(processor.process).to eq false
    end
  end

  context "when given a shapefile delete event" do
    let(:event_type) { "DELETED" }
    let(:layer_type) { "shapefile" }

    before do
      allow(Geoserver::Publish).to receive(:delete_shapefile)
    end

    it "deletes the shapefile layer in GeoServer" do
      expect(processor.process).to eq true
      expect(Geoserver::Publish).to have_received(:delete_shapefile)
    end
  end

  context "when given a geotiff delete event that causes an error" do
    let(:event_type) { "DELETED" }

    before do
      allow(Geoserver::Publish).to receive(:delete_geotiff).and_raise(Geoserver::Publish::Error)
    end

    it "returns false" do
      expect(processor.process).to eq false
    end
  end
end
