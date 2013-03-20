class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :nick, :string
    add_column :users, :surname, :string
  end
end
