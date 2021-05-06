require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  setup do
    @email = Email.new("testing@email.com")
  end

  test "#email" do
    assert_equal "testing@email.com", @email.email
  end

  test "#username" do
    assert_equal "testing", @email.username
  end

  test "#domain" do
    assert_equal "email.com", @email.domain
  end
end