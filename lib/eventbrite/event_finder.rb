require "eventbrite/finder"
require "eventbrite/null_event"

module Eventbrite
  class EventFinder < Finder
    def find
      if event_response.success?
        Eventbrite::Event.new(event_details)
      else
        Eventbrite::NullEvent.new
      end
    end

    private

    def event_details
      JSON.parse(event_response.body)
    end

    def event_response
      response_for(event_path)
    end

    def event_path
      "/events/#{id}"
    end
  end
end
