class AddContributorToActivity < ActiveRecord::Migration[6.0]
  def change
    add_reference :activities, :contributor, foreign_key: true
  end
end
