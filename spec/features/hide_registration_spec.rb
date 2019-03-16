require "rails_helper"
feature "Hiding registration" do
  let(:venue_name) { "Cool venue" }
  context "when registration is not hidden" do
    scenario "live events show up" do
      ClimateControl.modify VENUE_NAME: venue_name do
        visit root_path

        expect(page).to have_content venue_name
        expect(page).to have_content t("homes.show.register_for_workshop")
      end
    end
  end

  context "when registration is hidden because a live event isn't ready" do
    around do |example|
      ClimateControl.modify HIDE_REGISTRATION: "true", VENUE_NAME: venue_name do
        example.run
      end
    end

    scenario "the event does not show up" do

      visit root_path

      expect(page).not_to have_content venue_name
      expect(page).not_to have_content t("homes.show.register_for_workshop")
    end
  end
end
