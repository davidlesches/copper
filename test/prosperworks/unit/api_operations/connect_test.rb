require "test_helper"

class ConnectTest < Minitest::Test
  include Helpers

  def test_get_uri
    # get_uri is aliased in Helpers
    uri = get_uri("test_api", 14)

    assert_equal "https://api.copper.com/developer_api/v1/test_api/14", uri.to_s
  end

  def test_bad_request_response
    id = 2
    url = get_uri(Copper::Person.api_name, id)
    stub_request(:get, url).with(headers: headers).to_return(status: 400, body: "")

    assert Copper::Person.find(id).is_a?(Copper::Errors::BadRequest)
  end

  def test_forbidden_response
    id = 2
    url = get_uri(Copper::Person.api_name, id)
    stub_request(:get, url).with(headers: headers).to_return(status: 403, body: "")

    assert Copper::Person.find(id).is_a?(Copper::Errors::Forbidden)
  end

  def test_not_found_response
    id = 2
    url = get_uri(Copper::Person.api_name, id)
    stub_request(:get, url).with(headers: headers).to_return(status: 404, body: "")

    assert Copper::Person.find(id).is_a?(Copper::Errors::NotFound)
  end

  def test_rate_limit_response
    id = 2
    url = get_uri(Copper::Person.api_name, id)
    stub_request(:get, url).with(headers: headers).to_return(status: 429, body: "")

    assert Copper::Person.find(id).is_a?(Copper::Errors::RateLimit)
  end

  def test_server_error_response
    id = 2
    url = get_uri(Copper::Person.api_name, id)
    stub_request(:get, url).with(headers: headers).to_return(status: 500, body: "")

    assert Copper::Person.find(id).is_a?(Copper::Errors::ServerError)
  end

  def test_unauthorized_response
    id = 2
    url = get_uri(Copper::Person.api_name, id)
    stub_request(:get, url).with(headers: headers).to_return(status: 401, body: "")

    assert Copper::Person.find(id).is_a?(Copper::Errors::Unauthorized)
  end

  def test_unprocessable_response
    id = 2
    url = get_uri(Copper::Person.api_name, id)
    stub_request(:get, url).with(headers: headers).to_return(status: 422, body: "")

    assert Copper::Person.find(id).is_a?(Copper::Errors::Unprocessable)
  end
end
