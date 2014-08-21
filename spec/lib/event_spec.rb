require "nokogiri"
require "event"
require "venue"

describe Event do
  describe "#description" do
    it "returns the workshop content portion of the event description" do
      set_description_id_to
      description_html = '<b>Some</b> stuff'
      event = Event.new(event_with_description(description_html))

      expect(event.description).to eq(description_html)
    end

    it "clears out any styles" do
      set_description_id_to
      description_html = '<span style="color: red">Some</span> stuff'
      event = Event.new(event_with_description(description_html))

      expect(event.description).to eq('<span>Some</span> stuff')
    end

    context "when there is no description set" do
      it "returns placeholder text" do
        description_html = '<span style="color: red">Some</span> stuff'
        event = Event.new("description" => description_html)

        expect(event.description).to eq("More details to come.")
      end
    end

    def set_description_id_to
      stub_const("Event::DESCRIPTION_ELEMENT_ID", "somewhere")
    end

    def event_with_description(content)
      { "description" => %{<div id="somewhere">#{content}</div>} }
    end
  end

  describe "#dates" do
    it "returns the start and end dates as a single date format" do
      details = {
        "start_date" => "2014-09-19 19:00:00",
        "end_date" => "2014-09-20 19:00:00",
      }
      event = Event.new(details)

      expect(event.dates).to eq("September 19 & 20, 2014")
    end
  end

  describe "#venue" do
    it "returns the venue of the event" do
      venue = double(:venue)
      allow(Venue).to receive(:new).with("address info").and_return(venue)
      details = { "venue" => "address info" }
      event = Event.new(details)

      expect(event.venue).to eq(venue)
    end
  end
end
