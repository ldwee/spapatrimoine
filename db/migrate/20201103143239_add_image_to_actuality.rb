class AddImageToActuality < ActiveRecord::Migration[6.0]
  def change
    add_column :actualities, :image, :text
  end
end
