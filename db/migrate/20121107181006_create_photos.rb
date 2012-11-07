class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :post_id
      t.string :title
      t.string :photo
      t.string :slug

      t.timestamps
    end
  end
end