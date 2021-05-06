class PeopleController < ApplicationController
  def index
    page = params["page"].to_i
    page = page.zero? ? 1 : page

    @people = PeopleApi.new(page).all_people
  end

  def email_chars_count
    page = params["page"].to_i
    page = page.zero? ? 1 : page

    @people = PeopleApi.new(page).all_people

    respond_to do |format|
      format.js
    end
  end
end