require 'rails_helper'

RSpec.describe ActivityType do

  let(:activity_type_params) {{ title: 'Promenade' }}

  context 'validation tests' do

    it 'is valid with valid attributes' do
      expect(ActivityType.new(activity_type_params)).to be_valid
    end

    it 'is not valid without a title' do
      activity_type_params[:title] = nil
      expect(ActivityType.new(activity_type_params)).to_not be_valid
    end

  end

end
