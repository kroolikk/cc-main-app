class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.string :slug

      t.timestamps
    end

    add_index :posts, :slug, unique: true
  end
end
