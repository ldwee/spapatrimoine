class AddPatrimoineToActivity < ActiveRecord::Migration[6.0]
  def change
    add_reference :activities, :patrimoine, foreign_key: true
  end
end
