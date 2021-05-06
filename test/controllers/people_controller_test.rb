require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    stub_request(:get, "https://api.salesloft.com/v2/people.json?page")
      .to_return(status: 200, body: '{"data":[{"id": "1", "display_name": "test name", "email_address": "email@test.com"}]}', headers: {})
  end

  test "should get index" do
    get people_url

    assert_response :success
  end
end