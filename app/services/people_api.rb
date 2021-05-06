class PeopleApi
  def initialize(page = 1)
    @current_page = page
  end

  def all_people
    url = "https://api.salesloft.com/v2/people.json"

    response = RestClient.get(url, { :Authorization => "Bearer #{ENV["API_KEY"]}",
                                     :params => { page: @current_page }})

    result = JSON.parse(response.to_str)

    result = result["data"]

    create_people_objs(result)
  end

  private

  def create_people_objs(collection)
    people = []

    collection.each do |hash|
      people << PeoplePresenter.new(hash)
    end

    people
  end
end