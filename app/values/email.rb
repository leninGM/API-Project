class Email
  attr_reader :email

  def initialize(email)
    @email = email
  end

  def username
    splited_email.first
  end

  def domain
    splited_email.last
  end

  private

  def splited_email
    email.split("@")
  end
end