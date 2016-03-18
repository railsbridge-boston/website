module Eventbrite
  class NullEvent
    def title
      nil
    end

    def description
      "There are no upcoming workshops."
    end

    def dates
      nil
    end

    def url
      nil
    end

    def venue
      OpenStruct.new(
        name: nil,
        address: nil
      )
    end
  end
end
