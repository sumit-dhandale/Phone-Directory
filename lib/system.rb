require_relative 'dependencies'
class System
  attr_accessor :directory, :utilities

  def initialize
    @directory = Directory.new
    @utilities = Utilities.new
  end

  def run
    loop do
      puts "1. Add new contact"
      puts "2. Update contact"
      puts "3. Search contact"
      puts "4. Show all contacts"
      puts "5. Exit"
      choice = utilities.receive_user_input
      puts choice.to_str
      case choice
      when "1"
        puts "Enter first name, last name and Phone number"
        input = gets.chomp.split
        is_valid_record = utilities.valid_mobile_no?(input[2]) && utilities.valid_name?(input[0]) && utilities.valid_name?(input[1])
        if is_valid_record
          directory.add_new_contact(input[0], input[1], input[2])
        else
          utilities.print_result "Not a valid Record"
          return 
        end
      when "2"
        puts "Enter phone number, new phone number, new first name and new last name"
        input = gets.chomp.split
        directory.update_contact(phone_number: input[0], new_phone_number: input[1], new_first_name: input[2], new_last_name: input[3])
      when "3"
        puts "select type of search"
        puts "1. Prefix"
        puts "2. Complete"
        type_of_search = gets.chomp == "1" ? "prefix": "complete"
        puts "Select attribute to search on"
        puts "1. First Name"
        puts "2. Last Name"
        puts "3. Phone Number"
        input = gets.chomp
        type_of_key = input == "1" ? "first_name" : input == "2" ? "last_name" : "phone_number"
        puts "Enter key to search"
        key = utilities.receive_user_input
        result = directory.search(key, type_of_search, type_of_key)
        puts "**************************************Result******************************************"
        puts utilities.print_table(result)
        puts "***************************************************************************************"
      when "4"
        puts utilities.print_table(@directory.contacts)
      when "5"
        break
      else
        puts "Enter a valid option"
      end
    end
  end
end