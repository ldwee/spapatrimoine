class RemoveIllustrationFromPatrimoines < ActiveRecord::Migration[6.0]
  def change
    remove_column :patrimoines, :illustration, :string
  end
end
