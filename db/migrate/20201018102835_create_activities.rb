class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.text :description
      t.date :date
      t.string :status

      t.timestamps null: false
    end
  end
end
