require "lib/eventbrite"

module EventHelpers
  def next_event
    event_manager.upcoming_event
  end

  def next_event_venue
    next_event.venue
  end

  private

  def event_manager
    Eventbrite.new
  end
end
