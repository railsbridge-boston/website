require "climate_control"
require "json"
require "webmock/rspec"
require "tito"

describe Tito do
  around do |example|
    ClimateControl.modify TITO_AUTH_TOKEN: 'bar' do
      example.run
    end
  end

  describe "#upcoming_event" do
    it "return the upcoming event" do
      stub_successful_tito_request
      tito = Tito.new
      expect(tito.upcoming_event).to be_a(Tito::Event)
    end

    context "when there is no upcoming event" do
      it "returns a placeholder event" do
        stub_failed_tito_request
        tito = Tito.new
        expect(tito.upcoming_event).to be_a(Tito::NullEvent)
      end

      def stub_failed_tito_request
        stub_request(:get, tito_api_url).to_return(status: 500)
      end
    end

    def stub_successful_tito_request
      response = { events: [{ "title" => "event info" }] }

      stub_request(:get, tito_api_url).
        to_return(
          headers: { "Content-Type" => "application/json" },
          body: response.to_json,
      )
    end

    def tito_api_url
      /api\.tito\.io/
    end
  end
end
