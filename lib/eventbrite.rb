require "httparty"
require_relative "eventbrite/event"
require_relative "eventbrite/null_event"

class Eventbrite
  include HTTParty

  base_uri "https://www.eventbriteapi.com/v3"

  def upcoming_event
    event_list.first
  end

  private

  def event_list
    if user_events_response.success? && !events_from_response.empty?
      events_from_response.map do |event|
        Eventbrite::Event.new(event)
      end
    else
      [Eventbrite::NullEvent.new]
    end
  end

  def events_from_response
    user_events_response["events"]
  end

  def user_events_response
    @user_events_response ||= self.class.get(
      events_owned_by_user_api_url,
      query: credentials.merge(event_criteria)
    )
  end

  def events_owned_by_user_api_url
    "/users/#{user_id}/owned_events/"
  end

  def user_id
    if user_response.success?
      user_response["id"]
    end
  end

  def user_response
    @user_response ||= self.class.get(user_profile_api_url, query: credentials)
  end

  def user_profile_api_url
    "/users/me"
  end

  def credentials
    { token: ENV.fetch("EVENTBRITE_ACCESS_TOKEN") }
  end

  def event_criteria
    { status: "live" }
  end
end
