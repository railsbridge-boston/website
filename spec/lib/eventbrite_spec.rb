require "climate_control"
require "json"
require "webmock/rspec"
require "eventbrite"

describe Eventbrite do
  around do |example|
    ClimateControl.modify EVENTBRITE_ACCESS_TOKEN: "bar" do
      example.run
    end
  end

  describe "#upcoming_event" do
    it "returns the upcoming event" do
      stub_successful_eventbrite_request
      eventbrite = Eventbrite.new
      expect(eventbrite.upcoming_event).to be_an(Eventbrite::Event)
    end

    context "when there is no upcoming event" do
      it "returns a placeholder event" do
        stub_failed_eventbrite_request
        eventbrite = Eventbrite.new
        expect(eventbrite.upcoming_event).to be_an(Eventbrite::NullEvent)
      end

      def stub_failed_eventbrite_request
        stub_request(:get, eventbrite_api_url).to_return(body: { id: "123" })
        stub_request(:get, eventbrite_api_url).to_return(status: 500)
      end
    end

    def stub_successful_eventbrite_request
      response = { events: [{ "title" => "event info" }] }

      stub_request(:get, eventbrite_api_url).to_return(body: { id: "123" })
      stub_request(:get, eventbrite_api_url).
        to_return(
          headers: { "Content-Type" => "application/json" },
          body: response.to_json,
      )
    end

    def eventbrite_api_url
      /eventbriteapi.com/
    end
  end
end
