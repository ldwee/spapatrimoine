class AddStatusToPatrimoine < ActiveRecord::Migration[6.0]
  def change
    add_column :patrimoines, :status, :string
  end
end
