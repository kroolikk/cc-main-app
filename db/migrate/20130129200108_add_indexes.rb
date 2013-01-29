class AddIndexes < ActiveRecord::Migration
  def change
    add_index :places, :slug, unique: true
    add_index :photos, :slug, unique: true

    add_index :posts, :promoted
    add_index :posts, :category_id
    add_index :posts, :place_id
    add_index :posts, :is_event
  end
end
