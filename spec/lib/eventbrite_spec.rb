require "webmock/rspec"
require "eventbrite"
require "json"

describe Eventbrite do
  describe "#upcoming_events" do
    it "returns all the live events" do
      response = { events: [ event: "event info" ] }
      event = double(:event)
      allow(Event).to receive(:new).with("event info").and_return(event)

      with_stubbed_eventbrite_access do
        stub_eventbrite_request_with(response)
        eventbrite = Eventbrite.new

        expect(eventbrite.upcoming_events).to eq([event])
      end
    end

    context "when there are no events" do
      it "returns a list of a single null event" do
        response = { error: "something happened" }

        with_stubbed_eventbrite_access do
          stub_eventbrite_request_with(response)
          eventbrite = Eventbrite.new

          expect(eventbrite.upcoming_events.first).to be_a(NullEvent)
        end
      end
    end
  end

  def with_stubbed_eventbrite_access
    original_token = ENV['EVENTBRITE_ACCESS_TOKEN']

    begin
      ENV['EVENTBRITE_ACCESS_TOKEN'] = "supersecret"
      yield
    ensure
      ENV['EVENTBRITE_ACCESS_TOKEN'] = original_token
    end
  end

  def stub_eventbrite_request_with(response)
    stub_request(:get, eventbrite_url).
      to_return(
        headers: { "Content-Type" => "application/json" },
        body: response.to_json,
      )
  end

  def eventbrite_url
    /eventbrite\.com\/json/
  end
end
