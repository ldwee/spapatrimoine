require 'rails_helper'

RSpec.describe User do

  let(:user_params) {{
    email: 'example@email.com',
    firstname: 'Pablo',
    lastname: 'Escobar',
    password: '123123'
  }}

  context 'validation tests' do

    it 'is valid with valid attributes' do
      expect(User.new(user_params)).to be_valid
    end

    it 'is not valid without an email' do
      user_params[:email] = nil
      expect(User.new(user_params)).to_not be_valid
    end

    it 'is not valid without a first name' do
      user_params[:firstname] = nil
      expect(User.new(user_params)).to_not be_valid
    end

    it 'is not valid without a last name' do
      user_params[:lastname] = nil
      expect(User.new(user_params)).to_not be_valid
    end

  end

end
