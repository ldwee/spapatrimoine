class AddIpicToPatrimoine < ActiveRecord::Migration[6.0]
  def change
    add_column :patrimoines, :ipic, :string
  end
end
