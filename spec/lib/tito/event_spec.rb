require "tito/event"

describe Tito::Event do
  describe "#description" do
    it "returns the workshop content portion of the event description" do
      description = 'A really cool event you cannot miss'
      event = Tito::Event.new(event_with_description(description))

      expect(event.description).to eq(description)
    end

    context "when there is no description set" do
      it "returns placeholder text" do
        event = Tito::Event.new(event_with_description(''))
        expect(event.description).to eq("More details to come.")
      end
    end

    def event_with_description(content)
      { "description" => content }
    end
  end

  describe "#dates" do
    it "returns the start and end dates as a single date format" do
      details = {
        "start_date" => "2014-09-19",
        "end_date" => "2014-09-20",
      }
      event = Tito::Event.new(details)

      expect(event.dates).to eq("September 19 & 20, 2014")
    end
  end
end
