class AddCoordinatesToPatrimoines < ActiveRecord::Migration[6.0]
  def change
    add_column :patrimoines, :latitude, :float
    add_column :patrimoines, :longitude, :float
  end
end
