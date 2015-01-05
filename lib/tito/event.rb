class Tito
  class Event
    def initialize(details)
      @details = details
    end

    def title
      details["title"]
    end

    def description
      content = details["description"]

      if content.empty?
        "More details to come."
      else
        content
      end
    end

    def dates
      [
        Date.parse(start_date).strftime("%B %e"),
        Date.parse(end_date).strftime("%e, %Y")
      ].join(" & ")
    end

    def url
      details["url"]
    end

    private

    attr_reader :details

    def start_date
      details["start_date"]
    end

    def end_date
      details["end_date"]
    end
  end
end
