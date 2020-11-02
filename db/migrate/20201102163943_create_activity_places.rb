class CreateActivityPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_places do |t|
      t.string :Name
      t.string :Address
      t.timestamps
    end
  end
end
