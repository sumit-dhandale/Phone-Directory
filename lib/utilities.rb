# frozen_string_literal: true

class Utilities
  def print_result(output)
    puts output
  end

  def receive_user_input
    STDIN.gets.strip
  end

  def print_table(contacts)
    table_format = "first name    last name    Phone umber\n"

    contacts.each_with_index do |contact, idx|
      table_format += contact.first_name + '           ' + contact.last_name + '      ' + contact.phone_number
      table_format += "\n"
    end

    print_result table_format
  end

  def valid_mobile_no?(phone_number)
    return false if phone_number.nil? 
    phone_number.match?(/^[789]\d{9}$/)
  end

  def valid_name?(key)
    !key.nil?
  end
end
