require "httparty"

module Eventbrite
  class Finder
    include HTTParty

    base_uri "https://www.eventbriteapi.com/v3"

    def self.find(id)
      new(id).find
    end

    def initialize(id)
      @id = id
    end

    def find
      raise NotImplementedError, "must be implemented by subclass"
    end

    private

    attr_reader :id

    def response_for(endpoint)
      self.class.get(endpoint, query: credentials)
    end

    def credentials
      { token: ENV.fetch("EVENTBRITE_ACCESS_TOKEN") }
    end
  end
end
