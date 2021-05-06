require 'test_helper'

class ListPeoplePerPageTest < ActiveSupport::TestCase
  setup do
    stub_request(:get, "https://api.salesloft.com/v2/people.json?include_paging_counts=true&page=1")
      .to_return(status: 200, body: '{"data":[{"id": 1, "display_name": "test name", "email_address": "email@test.com"}]}', headers: {})
  end

  test "#execute" do
    assert_not ListPeoplePerPage.new.execute.empty?

    assert_equal(PeoplePresenter, ListPeoplePerPage.new.execute.first.class)
    assert_equal(1, ListPeoplePerPage.new.execute.first.id)
    assert_equal("test name", ListPeoplePerPage.new.execute.first.name)
    assert_equal("email@test.com", ListPeoplePerPage.new.execute.first.email)
  end
end