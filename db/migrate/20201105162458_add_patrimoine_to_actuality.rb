class AddPatrimoineToActuality < ActiveRecord::Migration[6.0]
  def change
    add_reference :actualities, :patrimoine, foreign_key: true
  end
end
