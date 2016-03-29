require "spec_helper"
require "climate_control"
require "eventbrite/venue_finder"
require "support/eventbrite_helpers"

describe Eventbrite::VenueFinder do
  include EventbriteHelpers

  around do |example|
    env_variables = { EVENTBRITE_ACCESS_TOKEN: "bar", }

    ClimateControl.modify env_variables do
      example.run
    end
  end

  describe ".find" do
    context "when there's a successful response" do
      it "returns an venue object" do
        allow(Eventbrite::Venue).to receive(:new)
        venue_body = { "name" => "Coolest Place" }
        stub_eventbrite_response(
          endpoint: "venue",
          body: venue_body,
          status: 200
        )

        Eventbrite::VenueFinder.find("123")

        expect(Eventbrite::Venue).to have_received(:new).with(venue_body)
      end
    end

    context "when there's a bad response" do
      it "returns a placeholder venue" do
        stub_eventbrite_response(
          endpoint: "venue",
          body: { id: "123" },
          status: 500
        )

        venue = Eventbrite::VenueFinder.find("123")

        expect(venue).to be_an(Eventbrite::NullVenue)
      end
    end
  end
end
