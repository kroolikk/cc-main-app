class AddSizeToPost < ActiveRecord::Migration
  def change
    add_column :posts, :size, :integer, :default => 0
  end
end
