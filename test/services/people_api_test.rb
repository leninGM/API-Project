require 'test_helper'

class PeopleApiTest < ActiveSupport::TestCase
  test "returns an array with people" do
    stub_request(:get, "https://api.salesloft.com/v2/people.json")
      .to_return(status: 200, body: '{"data":[{"id": "1", "display_name": "test name", "email_address": "email@test.com"}]}', headers: {})

      assert_equal({"id" => "1", "display_name" => "test name", "email_address" => "email@test.com"}, PeopleApi.all_people.first)
  end
end