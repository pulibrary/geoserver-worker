# frozen_string_literal: true
require "spec_helper"

RSpec.describe Geoserver::Worker do
  subject(:config) { described_class.config }

  it "loads a config object" do
    expect(config["events"]["server"]).not_to be_empty
    expect(config["events"]["exchange"]).not_to be_empty
  end
end
