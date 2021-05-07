class ListPeoplePerPage
  def initialize(page: 1, per_page: 25)
    @page = page
    @per_page = per_page
  end

  def execute
    result = PeopleApi.new(page: @page, per_page: @per_page).call
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