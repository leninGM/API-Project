class PeopleApi
  def initialize(page)
    @current_page = page
  end

  def all_people
    url = "https://api.salesloft.com/v2/people.json"

    response = RestClient.get(url, { :Authorization => "Bearer #{ENV["API_KEY"]}",
                                     :params => { page: @current_page }})

    result = JSON.parse(response.to_str)

    result["data"]
  end
end