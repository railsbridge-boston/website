require "httparty"
require_relative "eventbrite/event"
require_relative "eventbrite/null_event"

class Eventbrite
  include HTTParty

  base_uri "https://www.eventbriteapi.com/v3"

  def upcoming_event
    if event_response.success?
      Eventbrite::Event.new(event_response)
    else
      Eventbrite::NullEvent.new
    end
  end

  private

  def event_response
    @event_response ||= self.class.get(event_path, query: credentials)
  end

  def event_path
    "/events/#{ENV.fetch("NEXT_EVENT_ID")}"
  end

  def credentials
    { token: ENV.fetch("EVENTBRITE_ACCESS_TOKEN") }
  end
end
