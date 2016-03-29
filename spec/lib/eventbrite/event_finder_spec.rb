require "spec_helper"
require "climate_control"
require "eventbrite/event_finder"

describe Eventbrite::EventFinder do
  around do |example|
    env_variables = { EVENTBRITE_ACCESS_TOKEN: "bar", NEXT_EVENT_ID: "123" }

    ClimateControl.modify env_variables do
      example.run
    end
  end

  describe ".find" do
    context "when there's a successful response" do
      it "returns an event object" do
        allow(Eventbrite::Event).to receive(:new)
        event_body = { "name" => { "text" => "event info" } }
        stub_eventbrite_response(body: event_body, status: 200)

        Eventbrite::EventFinder.find("123")

        expect(Eventbrite::Event).to have_received(:new).with(event_body)
      end
    end

    context "when there's a bad response" do
      it "returns a placeholder event" do
        stub_eventbrite_response(body: { id: "123" }, status: 500)

        event = Eventbrite::EventFinder.find("123")

        expect(event).to be_an(Eventbrite::NullEvent)
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
