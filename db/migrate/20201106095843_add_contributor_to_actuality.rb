class AddContributorToActuality < ActiveRecord::Migration[6.0]
  def change
    add_reference :actualities, :contributor, foreign_key: true
  end
end
