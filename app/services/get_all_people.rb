class GetAllPeople
  def self.execute
    result = PeopleApi.new.call

    metadata = result["metadata"]
    total_pages = metadata["paging"]["total_pages"]
    collection = []

    (1..total_pages.to_i).each do |page|
      collection << ListPeoplePerPage.new(page).execute
    end

    collection.flatten
  end
end