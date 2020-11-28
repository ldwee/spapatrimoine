class AddHasImageToPatrimoine < ActiveRecord::Migration[6.0]
  def change
    add_column :patrimoines, :has_image, :boolean
  end
end
