module EventsHelper
  def next_event
    event_manager.upcoming_event
  end

  def next_event_venue
    next_event.venue
  end

  def show_registration?
    ENV["HIDE_REGISTRATION"] != "true"
  end

  private

  def event_manager
    @event_manager ||= Eventbrite.new
  end
end
