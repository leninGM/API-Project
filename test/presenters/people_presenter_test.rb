require 'test_helper'

class PeoplePresenterTest < ActiveSupport::TestCase
  setup do
    person_attributes = {"id" => "1", "display_name" => "Barth Simpson", "email_address" => "barth@email.com", "title" => "Software Eng"}

    @person = PeoplePresenter.new(person_attributes)
  end

  test "#email" do
    assert_equal "barth@email.com", @person.email
  end

  test "#name" do
    assert_equal "Barth Simpson", @person.name
  end

  test "#title" do
    assert_equal "Software Eng", @person.title
  end

  test "#email_chars_frequency" do
    person = PeoplePresenter.new({"email_address" => "aa@bbb.c"})
    hash = { "b" => 3, "a" => 2, "c" => 1, "@" => 1, "." => 1 }
    assert_equal hash, person.email_chars_frequency
  end
end