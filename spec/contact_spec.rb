# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Contact do
  let(:first_name) { 'Sumit' }
  let(:last_name) { 'Dhandale' }
  let(:phone_number) { '7773931044' }
  subject(:contact) { Contact.new(first_name: first_name, last_name: last_name, phone_number: phone_number) }

  it 'has proper attribute value' do
    expect(contact.first_name).to eq(first_name)
    expect(contact.last_name).to eq(last_name)
    expect(contact.phone_number).to eq(phone_number)
  end
end
