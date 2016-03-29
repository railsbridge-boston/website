require "spec_helper"
require "climate_control"
require "eventbrite/venue_finder"

describe Eventbrite::VenueFinder do
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
        stub_eventbrite_response(body: venue_body, status: 200)

        Eventbrite::VenueFinder.find("123")

        expect(Eventbrite::Venue).to have_received(:new).with(venue_body)
      end
    end

    context "when there's a bad response" do
      it "returns a placeholder venue" do
        stub_eventbrite_response(body: { id: "123" }, status: 500)

        venue = Eventbrite::VenueFinder.find("123")

        expect(venue).to be_an(Eventbrite::NullVenue)
      end
    end

    def stub_eventbrite_response(body:, status:)
      stub_request(:get, eventbrite_api_url).to_return(
        headers: { "Content-Type" => "application/json" },
        body: body.to_json,
        status: status
      )
    end

    def eventbrite_api_url
      /eventbriteapi.com/
    end
  end
end
