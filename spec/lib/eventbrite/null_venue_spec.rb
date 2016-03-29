require "spec_helper"
require "eventbrite/null_venue"

describe Eventbrite::NullVenue do
  describe "#name" do
    it "returns 'Location TBD'" do
      venue = Eventbrite::NullVenue.new
      expect(venue.name).to eq("Location TBD")
    end
  end

  describe "#address" do
    it "returns an empty string" do
      venue = Eventbrite::NullVenue.new
      expect(venue.address).to be_empty
    end
  end
end
