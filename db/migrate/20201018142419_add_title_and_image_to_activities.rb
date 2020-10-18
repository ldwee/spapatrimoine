class AddTitleAndImageToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :title, :string
    add_column :activities, :image, :text
  end
end
