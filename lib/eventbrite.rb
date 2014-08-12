require "eventbrite-client"
require_relative "event"
require_relative "null_event"

class Eventbrite
  def upcoming_events
    if live_events.empty?
      [NullEvent.new]
    else
      live_events["events"].map do |event|
        Event.new(event["event"])
      end
    end
  end

  private

  def live_events
    event_list(event_statuses: "live")
  rescue RuntimeError
    {}
  end

  def event_list(criteria)
    client.user_list_events(criteria)
  end

  def client
    @client ||= EventbriteClient.new(
      access_token: ENV.fetch('EVENTBRITE_ACCESS_TOKEN')
    )
  end
end
