class Contact
  attr_accessor :first_name, :last_name, :phone_number

  def initialize(first_name:, last_name: "", phone_number: )
    @first_name = first_name
    @last_name = last_name
    @phone_number = phone_number
  end
end