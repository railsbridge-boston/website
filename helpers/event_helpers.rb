require "lib/tito"

module EventHelpers
  def next_event
    event_manager.upcoming_event
  end

  private

  def event_manager
    Tito.new
  end
end
