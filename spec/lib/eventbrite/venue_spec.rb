require "eventbrite/venue"

describe Eventbrite::Venue do
  describe "#name" do
    it "returns the name of the venue" do
      details = { "name" => "Microsoft NERD" }
      venue = Eventbrite::Venue.new(details)
      expect(venue.name).to eq("Microsoft NERD")
    end

    context "when there is no venue name" do
      it "returns 'Location TBD'" do
        details = { "name" => nil }
        venue = Eventbrite::Venue.new(details)
        expect(venue.name).to eq("Location TBD")
      end
    end
  end

  describe "#address" do
    it "returns the full address of the venue" do
      details = {
        "address" => {
          "address_1" => "1 Memorial Dr",
          "address_2" => "1st Fl",
          "city" => "Cambridge",
          "region" => "MA",
          "postal_code" => "02142",
        }
      }
      venue = Eventbrite::Venue.new(details)

      expect(venue.address).to eq("1 Memorial Dr, 1st Fl, Cambridge, MA 02142")
    end

    context "when there are no address details" do
      it "returns an empty string" do
        details = { "address" => nil }
        venue = Eventbrite::Venue.new(details)
        expect(venue.address).to be_empty
      end
    end

    context "when there are blank values" do
      it "ignores those fields" do
        details = {
          "address" => {
            "address_1" => "",
            "address_2" => "",
            "city" => "Cambridge",
            "region" => "MA",
            "postal_code" => "",
          }
        }
        venue = Eventbrite::Venue.new(details)

        expect(venue.address).to eq("Cambridge, MA")
      end
    end
  end
end
