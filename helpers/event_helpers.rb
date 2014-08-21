require "lib/eventbrite"

module EventHelpers
  def next_event
    event_manager.upcoming_events.first
  end

  private

  def event_manager
    Eventbrite.new
  end
end
