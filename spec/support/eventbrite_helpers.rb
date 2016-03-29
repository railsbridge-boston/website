module EventbriteHelpers
  def stub_eventbrite_response(endpoint:, body:, status:)
    path = eventbrite_api_url_with(endpoint)

    stub_request(:get, path).to_return(
      headers: { "Content-Type" => "application/json" },
      body: body.to_json,
      status: status
    )
  end

  def eventbrite_api_url_with(pattern)
    %r{eventbriteapi.com/.*#{pattern}}
  end
end
