class AddActivityTypeToActivity < ActiveRecord::Migration[6.0]
  def change
    add_reference :activities, :activity_type, foreign_key: true
  end
end
