class AddPromotedToPost < ActiveRecord::Migration
  def change
    add_column :posts, :promoted, :integer, :default => 0
  end
end
