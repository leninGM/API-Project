require 'test_helper'

class PeopleApiTest < ActiveSupport::TestCase
  test "returns an array with PeoplePresenter objs" do
    stub_request(:get, "https://api.salesloft.com/v2/people.json?include_paging_counts=true&page=1")
      .to_return(status: 200, body: '{"data":[{"id": "1", "display_name": "test name", "email_address": "email@test.com"}]}', headers: {})

      assert_equal({"data"=>[{"id"=>"1", "display_name"=>"test name", "email_address"=>"email@test.com"}]}, PeopleApi.new.call)
  end
end