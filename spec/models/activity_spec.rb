require 'rails_helper'

RSpec.describe Activity do

  context 'validation tests' do

    let(:activity_params) {{
    title: 'Visite du musée de la lessive',
    description: 'Vraiment cool',
    status: 'attente',
    contributor: FactoryBot.create(:contributor)
  }}

    it 'is valid with valid attributes' do
      expect(Activity.new(activity_params)).to be_valid
    end

    it 'is not valid without a title' do
      activity_params[:title] = nil
      expect(Activity.new(activity_params)).to_not be_valid
    end

    it 'is not valid without a description' do
      activity_params[:description] = nil
      expect(Activity.new(activity_params)).to_not be_valid
    end

    it 'is not valid without a status' do
      activity_params[:status] = nil
      expect(Activity.new(activity_params)).to_not be_valid
    end

    it 'is not valid without a contributor' do
      activity_params[:contributor] = nil
      expect(Activity.new(activity_params)).to_not be_valid
    end

    it 'can only have a specific status (attente, acceptée, refusée)' do
      activity_params[:status] = 'attente'
      expect(Activity.new(activity_params)).to be_valid
      activity_params[:status] = 'acceptée'
      expect(Activity.new(activity_params)).to be_valid
      activity_params[:status] = 'refusée'
      expect(Activity.new(activity_params)).to be_valid
      activity_params[:status] = 'autre'
      expect(Activity.new(activity_params)).to_not be_valid
    end

  end

  context 'when activity has an accepted status' do

    let(:activity_params) {{
    title: 'Visite du musée de la lessive',
    description: 'Vraiment cool',
    status: 'acceptée',
    contributor: FactoryBot.create(:contributor),
    date: Date.today,
    image: 'https://picsum.photos/200/300',
    activity_type: FactoryBot.create(:activity_type),
    activity_place: FactoryBot.create(:activity_place)
  }}

    it 'is valid with valid attributes' do
      expect(Activity.new(activity_params)).to be_valid
    end

    it 'is not valid without a date' do
      activity_params[:date] = nil
      expect(Activity.new(activity_params)).to_not be_valid
    end

    it 'is not valid without an image' do
      activity_params[:image] = nil
      expect(Activity.new(activity_params)).to_not be_valid
    end

    it 'is not valid without an activity type' do
      activity_params[:activity_type] = nil
      expect(Activity.new(activity_params)).to_not be_valid
    end

    it 'is not valid without an activity place' do
      activity_params[:activity_place] = nil
      expect(Activity.new(activity_params)).to_not be_valid
    end

    it 'is valid with and without a patrimoine' do

    end

  end

end
