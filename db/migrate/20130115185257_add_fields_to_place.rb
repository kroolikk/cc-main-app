class AddFieldsToPlace < ActiveRecord::Migration
  def change
    add_column :places, :phone, :string
    add_column :places, :website, :string
    add_column :places, :opening_hours, :text
    add_column :places, :info, :text
  end
end
