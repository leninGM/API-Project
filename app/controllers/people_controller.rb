class PeopleController < ApplicationController
  def index
    page = params["page"].to_i
    page = page.zero? ? 1 : page

    @people = PeopleApi.new(page).all_people
  end
end