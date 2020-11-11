class CreateActualities < ActiveRecord::Migration[6.0]
  def change
    create_table :actualities do |t|
      t.string :titre
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
