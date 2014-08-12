class Venue
  def initialize(details)
    @details = details
  end

  def name
    details["name"]
  end

  def address
    [
      street_and_city,
      details["postal_code"]
    ].reject(&:empty?).join(" ")
  end

  private

  attr_reader :details

  def street_and_city
    [
      details["address"],
      details["address_2"],
      details["city"],
      details["region"],
    ].reject(&:empty?).join(", ")
  end
end
