class PeopleController < ApplicationController
  before_action :load_people, only: %w(index email_chars_count similar_emails)
  before_action :load_complete_people_list, only: %w(similar_emails)

  def email_chars_count
    respond_to do |format|
      format.js
    end
  end

  def similar_emails
    person = @complete_people_list.find { |obj| obj.id == people_params[:id].to_i }

    emails = @complete_people_list.map(&:email)

    username = Email.new(person.email).username

    @similar_emails = emails.grep(/#{username}/)

    respond_to do |format|
      format.js
    end
  end

  private

  def people_params
    params.permit(:id)
  end

  def load_people
    page = params["page"].to_i
    page = page.zero? ? 1 : page

    @people = ListPeoplePerPage.new(page: page).execute
  end

  def load_complete_people_list
    @complete_people_list = GetAllPeople.execute
  end
end