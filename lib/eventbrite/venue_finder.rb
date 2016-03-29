require "eventbrite/finder"
require "eventbrite/venue"
require "eventbrite/null_venue"

module Eventbrite
  class VenueFinder < Finder
    def find
      if venue_response.success?
        Eventbrite::Venue.new(venue_details)
      else
        Eventbrite::NullVenue.new
      end
    end

    private

    def venue_details
      JSON.parse(venue_response.body)
    end

    def venue_response
      response_for(venue_path)
    end

    def venue_path
      "/venues/#{id}"
    end
  end
end
