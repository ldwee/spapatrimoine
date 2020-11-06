require 'rails_helper'

RSpec.describe Contributor do

  let(:contributor_params) {{
    firstname: 'John',
    lastname: 'Rambo',
    email: 'john@email.com'
  }}

  context 'validation tests' do

    it 'is valid with valid params' do
      expect(Contributor.new(contributor_params)).to be_valid
    end

    it 'is not valid without a first name' do
      contributor_params[:firstname] = nil
      expect(Contributor.new(contributor_params)).to_not be_valid
    end

    it 'is not valid without a last name' do
      contributor_params[:lastname] = nil
      expect(Contributor.new(contributor_params)).to_not be_valid
    end

    it 'is not valid without an email address' do
      contributor_params[:email] = nil
      expect(Contributor.new(contributor_params)).to_not be_valid
    end

  end

end
