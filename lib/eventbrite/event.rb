require_relative "venue"

class Eventbrite
  class Event
    def initialize(details)
      @details = details
    end

    def title
      details["name"]["text"]
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
      Eventbrite::Venue.new(venue_details)
    end

    private

    attr_reader :details

    def start_date
      details["start"]["local"]
    end

    def end_date
      details["end"]["local"]
    end

    def venue_details
      details["venue"] ||= {}
    end
  end
end
