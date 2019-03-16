module EventsHelper
  def next_event
    OpenStruct.new(
      venue: venue,
      url: ENV.fetch("EVENT_URL")
    )
    # @next_event ||= Eventbrite::EventFinder.find(ENV.fetch("NEXT_EVENT_ID"))
  end

  def next_event_venue
    next_event.venue
  end

  def venue 
    OpenStruct.new(
      name: ENV.fetch("VENUE_NAME"),
      address: ENV.fetch("VENUE_ADDRESS")
    )
  end

  def show_registration?
    ENV["HIDE_REGISTRATION"] != "true"
  end
end
