class AddActivityToActuality < ActiveRecord::Migration[6.0]
  def change
    add_reference :actualities, :activity, foreign_key: true
  end
end
