require "rails_helper"

feature "Hiding registration" do
  context "when registration is not hidden" do
    scenario "live events show up" do
      ClimateControl.modify NEXT_EVENT_ID: "supersecret" do
        stub_upcoming_event("Cool Venue")

        visit root_path

        expect(page).to have_content "Cool Venue"
        expect(page).to have_content t("homes.show.register_for_workshop")
      end
    end
  end

  context "when registration is hidden because a live event isn't ready" do
    around do |example|
      ClimateControl.modify HIDE_REGISTRATION: "true" do
        example.run
      end
    end

    scenario "the event does not show up" do
      stub_upcoming_event("Cool Venue")

      visit root_path

      expect(page).not_to have_content "Cool Venue"
      expect(page).not_to have_content t("homes.show.register_for_workshop")
    end
  end

  def stub_upcoming_event(venue_name)
    upcoming_event = Eventbrite::Event.new(
      "name" => { "text" => "Whatever" },
      "url" => "http://example.com",
      "start" => { "local" => "2014-09-19" },
      "end" => { "local" => "2014-09-20" },
      "venue" => { "name" => venue_name },
    )

    allow(Eventbrite::EventFinder).to receive(:find).and_return(upcoming_event)
  end
end
