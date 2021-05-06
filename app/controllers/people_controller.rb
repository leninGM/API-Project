class PeopleController < ApplicationController
  def index
    @people = PeopleApi.all_people
  end
end