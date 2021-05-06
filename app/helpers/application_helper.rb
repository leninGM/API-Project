module ApplicationHelper
  def previous_page
    page = params["page"].to_i - 1
    page <= 0 ? 1 : page
  end

  def next_page
    params["page"].to_i + 1
  end

  def page_option_1
    params["page"].to_i + 1
  end

  def page_option_2
    params["page"].to_i + 2
  end

  def page_option_3
    params["page"].to_i + 3
  end

  def email_chars_frequency(email)
    chars = email.chars.uniq

    chars_count = {}

    chars.each do |char|
      chars_count[char] = email.count(char)
    end

    chars_count.sort_by(&:last).reverse.to_h
  end
end
