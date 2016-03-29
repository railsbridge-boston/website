require "eventbrite/event"

describe Eventbrite::Event do
  describe "#dates" do
    it "returns the start and end dates as a single date format" do
      details = {
        "start" => { "local" => "2014-09-19" },
        "end" => { "local" => "2014-09-20" },
      }
      event = Eventbrite::Event.new(details)

      expect(event.dates).to eq("September 19 & 20, 2014")
    end
  end

  describe "#venue" do
    it "returns the venue of the event" do
      details = { "venue" => "some event info" }
      event = Eventbrite::Event.new(details)
      expect(event.venue).to be_an(Eventbrite::Venue)
    end

    context "when there is no venue" do
      it "creates an Eventbrite::Venue with an empty hash" do
        venue = double(:venue)
        allow(Eventbrite::Venue).to receive(:new).and_return(venue)
        details = { "title" => "Event with no venue" }

        event = Eventbrite::Event.new(details)

        expect(event.venue).to eq(venue)
        expect(Eventbrite::Venue).to have_received(:new).with({})
      end
    end
  end
end
