require_relative 'search'
class Directory
  include Search
  attr_reader :contacts

  def initialize
    @contacts = []
    @utilities = Utilities.new
  end

  def add_new_contact(first_name, last_name, phone_number)
    result = search(phone_number, "complete", "phone_number")
    unless result.empty?
      puts "**************************************Result******************************************"
      @utilities.print_table(result)
      puts "***************************************************************************************"
      puts "Contact already exists"
    else
      contact = Contact.new(first_name: first_name, last_name: last_name, phone_number: phone_number)
      contacts.push(contact)
      @utilities.print_result "Record Added successfully"
    end
  end

  def update_contact(phone_number:, new_phone_number:, new_first_name:, new_last_name:)
    contact = contacts.find { |contact| contact.phone_number == phone_number }
    unless contact
      @utilities.print_result("Contact not found.")
      return
    end
  
    contact.phone_number = new_phone_number if new_phone_number
    contact.first_name = new_first_name if new_first_name
    contact.last_name = new_last_name if new_last_name
    @utilities.print_result("Record Updated successfully.")
  end
  
  def search(key, type_of_search, type_of_attribute)
    case type_of_search
    when "prefix"
      prefix_search_by(type_of_attribute, key)
    when "complete"
      complete_search_by(type_of_attribute, key)
    else
      raise ArgumentError, "Invalid type of search. Must be 'prefix' or 'complete'."
    end
  end

end
