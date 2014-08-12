class Event
  DESCRIPTION_ELEMENT_ID = "what-will-i-learn"

  def initialize(details)
    @details = details
  end

  def title
    details["title"]
  end

  def description
    content = html_node_for(full_description).first

    content.traverse do |node|
      node.delete "style"
    end

    content.inner_html
  end

  def dates
    [
      Date.parse(start_date).strftime("%B %e"),
      Date.parse(end_date).strftime("%e, %Y")
    ].join(" & ")
  end

  def url
    details["url"]
  end

  def venue
    Venue.new(details["venue"])
  end

  private

  attr_reader :details, :element_locator

  def element_locator
    "##{DESCRIPTION_ELEMENT_ID}"
  end

  def html_node_for(content)
    Nokogiri::HTML(content).search(element_locator)
  end

  def full_description
    details["description"]
  end

  def start_date
    details["start_date"]
  end

  def end_date
    details["end_date"]
  end
end
