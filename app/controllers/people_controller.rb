class PeopleController < ApplicationController
  def index
    url = "https://api.salesloft.com/v2/people.json"
    api_key = ENV["API_KEY"]

    response = RestClient.get(url, {:Authorization => "Bearer #{api_key}"})

    result = JSON.parse(response.to_str)

    @people = result["data"]
  end
end