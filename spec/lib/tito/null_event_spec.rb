require "tito/null_event"

describe Tito::NullEvent do
  def null_event
    Tito::NullEvent.new
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
end
