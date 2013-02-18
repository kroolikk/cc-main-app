class AddTagListToPost < ActiveRecord::Migration
  def change
    add_column :posts, :list_of_tags, :text
  end
end
