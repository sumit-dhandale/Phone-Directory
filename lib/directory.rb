require_relative 'search'
class Directory
  include Search
  attr_reader :contacts

  def initialize
    @contacts = []
    @utilities = Utilities.new
  end

  def add_new_contact(first_name, last_name, phone_number)
    if search(phone_number, "complete", "phone_number")
      puts "Contact alredy exists"
    else
      contact = Contact.new(first_name: first_name, last_name: last_name, phone_number: phone_number)
      contacts.push(contact)
      utilities.print_result "Record Added successfully"
    end
  end

  def update_contact(phone_number: , new_phone_number: , new_first_name: , new_last_name: )
     contact = contacts.find { |contact| contact.phone_number.to_str.match?(phone_number)}
     @utilities.print_result "Contact not found." unless contact 
     contact.phone_number = new_phone_number if new_phone_number&.presence
     contact.first_name = new_first_name if new_first_name&.presence
     contact.last_name = new_last_name if new_last_name&.presence
  end


  def search(key, type_of_search = "prefix", type_of_attribute = "first_name")
    public_send("#{type_of_search}_search_by_#{type_of_attribute}", key)
  end
end
