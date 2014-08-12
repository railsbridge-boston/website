require "venue"

describe Venue do
  describe "#address" do
    it "returns the full address of the venue" do
      details = {
        "address" => "1 Memorial Drive",
        "address_2" => "1st Floor",
        "city" => "Cambridge",
        "region" => "MA",
        "postal_code" => "02142",
      }
      venue = Venue.new(details)

      expect(venue.address).to eq("1 Memorial Drive, 1st Floor, Cambridge, MA 02142")
    end

    context "when there are blank values" do
      it "ignores those fields" do
        details = {
          "address" => "",
          "address_2" => "",
          "city" => "Cambridge",
          "region" => "MA",
          "postal_code" => "",
        }
        venue = Venue.new(details)

        expect(venue.address).to eq("Cambridge, MA")
      end
    end
  end
end
