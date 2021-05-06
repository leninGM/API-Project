class PeopleController < ApplicationController
  before_action :load_people, only: %w(index email_chars_count)

  def email_chars_count
    respond_to do |format|
      format.js
    end
  end

  private

  def load_people
    page = params["page"].to_i
    page = page.zero? ? 1 : page

    @people = PeopleApi.new(page).all_people
  end
end