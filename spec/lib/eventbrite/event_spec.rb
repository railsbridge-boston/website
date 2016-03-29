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
    it "finds the venue based on the venue id" do
      venue = double(:venue)
      allow(Eventbrite::VenueFinder).to receive(:find).and_return(venue)
      details = { "title" => "Event with no venue" }

      event = Eventbrite::Event.new(details)

      expect(event.venue).to eq(venue)
      expect(Eventbrite::VenueFinder).to have_received(:find).with("")
    end
  end
end
