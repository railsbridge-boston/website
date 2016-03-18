module EventsHelper
  def next_event
    @next_event ||= Eventbrite::EventFinder.find(ENV.fetch("NEXT_EVENT_ID"))
  end

  def next_event_venue
    next_event.venue
  end

  def show_registration?
    ENV["HIDE_REGISTRATION"] != "true"
  end
end
