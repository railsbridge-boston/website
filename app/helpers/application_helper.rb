module ApplicationHelper
  def signup_form_url
    "//getform.io/f/170d6d2e-01ba-481a-a532-74405f3ed4bc"
  end

  def venue_map_url
    ENV.fetch("VENUE_MAP_URL")
  end

  def data_links
    @data_links ||= YAML.load_file(Rails.root.join("app/data/links.yml"))
  end
end
