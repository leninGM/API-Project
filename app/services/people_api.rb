class PeopleApi
  def self.all_people
    url = "https://api.salesloft.com/v2/people.json"

    response = RestClient.get(url, {:Authorization => "Bearer #{ENV["API_KEY"]}"})

    result = JSON.parse(response.to_str)

    result["data"]
  end
end