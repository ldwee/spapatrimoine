class AddContributorToPatrimoine < ActiveRecord::Migration[6.0]
  def change
    add_reference :patrimoines, :contributor, foreign_key: true
  end
end
