class AddEventFieldsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :is_event, :boolean
    add_column :posts, :event_start, :datetime
  end
end
