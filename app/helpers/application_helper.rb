module ApplicationHelper
  def mailchimp_form_url
    "//railsbridgeboston.us6.list-manage.com/subscribe/post?u=1b4272afae4569dec6efb74bb&id=1ec91857a1"
  end

  def venue_map_url
    ENV.fetch("VENUE_MAP_URL")
  end

  def data_links
    @data_links ||= YAML.load_file(Rails.root.join("app/data/links.yml"))
  end
end
