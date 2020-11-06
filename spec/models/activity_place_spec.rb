require 'rails_helper'

RSpec.describe ActivityPlace do

  let(:activity_place_params) {{
    name: 'Place de Spa',
    address: 'Centre de Spa'
  }}

  context 'validation tests' do

    it 'is valid with valid attributes' do
      expect(ActivityPlace.new(activity_place_params)).to be_valid
    end

    it 'is not valid without a name' do
      activity_place_params[:name] = nil
      expect(ActivityPlace.new(activity_place_params)).to_not be_valid
    end

    it 'is not valid without an address' do
      activity_place_params[:address] = nil
      expect(ActivityPlace.new(activity_place_params)).to_not be_valid
    end

  end

end
