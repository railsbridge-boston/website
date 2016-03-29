require "spec_helper"
require "climate_control"
require "eventbrite/event_finder"
require "support/eventbrite_helpers"

describe Eventbrite::EventFinder do
  include EventbriteHelpers

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
        stub_eventbrite_response(
          endpoint: "event",
          body: event_body,
          status: 200
        )

        Eventbrite::EventFinder.find("123")

        expect(Eventbrite::Event).to have_received(:new).with(event_body)
      end
    end

    context "when there's a bad response" do
      it "returns a placeholder event" do
        stub_eventbrite_response(
          endpoint: "event",
          body: { id: "123" },
          status: 500
        )

        event = Eventbrite::EventFinder.find("123")

        expect(event).to be_an(Eventbrite::NullEvent)
      end
    end
  end
end
