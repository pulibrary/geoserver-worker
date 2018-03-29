# frozen_string_literal: true
RSpec.describe Geoserver::Worker do
  it "has a version number" do
    expect(Geoserver::Worker::VERSION).not_to be nil
  end
end
