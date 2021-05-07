require 'test_helper'

class GetAllPeopleTest < ActiveSupport::TestCase
  setup do
    stub_request(:get, "https://api.salesloft.com/v2/people.json?include_paging_counts=true&page=1&per_page=100")
      .to_return(status: 200, body: '{"metadata": { "paging": {"total_pages": 1} },"data":[{"id": 1, "display_name": "test name", "email_address": "email@test.com"}]}', headers: {})
  end

  test "#execute" do
    result = GetAllPeople.execute
    assert_not result.empty?

    assert_equal(1, result.count)
    assert_equal(PeoplePresenter, result.first.class)
    assert_equal(1, result.first.id)
    assert_equal("test name", result.first.name)
    assert_equal("email@test.com", result.first.email)
  end
end