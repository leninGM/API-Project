class PeopleApi
  def initialize(page = 1)
    @current_page = page
  end

  def call
    url = "https://api.salesloft.com/v2/people.json"

    response = RestClient.get(url, { :Authorization => "Bearer #{ENV["API_KEY"]}",
                                     :params => { page: @current_page, include_paging_counts: true }})

    JSON.parse(response.to_str)
  end
end