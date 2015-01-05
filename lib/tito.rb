require "httparty"
require_relative "tito/event"
require_relative "tito/null_event"

class Tito
  include HTTParty

  base_uri "https://api.tito.io/railsbridge-boston"

  def upcoming_event
    event_list.first
  end

  private

  def event_list
    if response.success? && !response["events"].empty?
      response["events"].map do |event|
        Event.new(event)
      end
    else
      [NullEvent.new]
    end
  end

  def response
    self.class.get("/events.json", options)
  end

  def options
    { query: { auth_token: ENV.fetch("TITO_AUTH_TOKEN") } }
  end
end
