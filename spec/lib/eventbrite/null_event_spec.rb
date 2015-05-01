require "eventbrite/null_event"

describe Eventbrite::NullEvent do
  def null_event
    Eventbrite::NullEvent.new
  end

  describe "#title" do
    it "returns nil" do
      expect(null_event.title).to be_nil
    end
  end

  describe "#description" do
    it "returns a message about no scheduled events" do
      expect(null_event.description).to eq("There are no upcoming workshops.")
    end
  end

  describe "#dates" do
    it "returns nil" do
      expect(null_event.dates).to be_nil
    end
  end

  describe "#url" do
    it "returns nil" do
      expect(null_event.url).to be_nil
    end
  end

  describe "#venue" do
    it "returns an object with a nil name and address" do
      expect(null_event.venue.name).to be_nil
      expect(null_event.venue.address).to be_nil
    end
  end
end
