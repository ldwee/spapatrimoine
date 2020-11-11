class AddActivityPlaceToActivity < ActiveRecord::Migration[6.0]
  def change
    add_reference :activities, :activity_place, foreign_key: true
  end
end
