module Eventbrite
  class Venue
    def initialize(details)
      @details = details
    end

    def name
      details["name"] ||= "Location TBD"
    end

    def address
      [
        street_and_city,
        address_details["postal_code"]
      ].compact.reject(&:empty?).join(" ")
    end

    private

    attr_reader :details

    def street_and_city
      [
        address_details["address_1"],
        address_details["address_2"],
        address_details["city"],
        address_details["region"],
      ].compact.reject(&:empty?).join(", ")
    end

    def address_details
      details["address"] ||= {}
    end
  end
end
