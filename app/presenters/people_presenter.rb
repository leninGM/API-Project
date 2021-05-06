class PeoplePresenter
  attr_accessor :email, :name, :title

  def initialize(opts)
    @email = opts["email_address"]
    @name = opts["display_name"]
    @title = opts["title"]
  end

  def email_chars_frequency
    chars_count = {}
    chars = email.chars.uniq

    chars.each do |char|
      chars_count[char] = email.count(char)
    end

    chars_count.sort_by(&:last).reverse.to_h
  end
end
