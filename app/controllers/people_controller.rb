class PeopleController < ApplicationController
  def index
    @people = PeopleApi.new(params["page"]).all_people
  end
end