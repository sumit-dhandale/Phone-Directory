# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Utilities do
  subject(:utilities) { Utilities.new }

  describe '#print_result' do
    it 'prints given result to STDOUT' do
      output_str = 'output string'

      expect(STDOUT).to receive(:puts).with(output_str)

      utilities.print_result output_str
    end
  end

  describe '#receive_user_input' do
    it 'receive and return user input' do
      input_str = 'input string'

      allow(STDIN).to receive(:gets) { input_str }

      expect(utilities.receive_user_input).to eq(input_str)
    end
  end
end

