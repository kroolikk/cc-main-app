class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :city
      t.string :street
      t.string :street_no
      t.string :zip_code
      t.boolean :detect_coords, :default => true
      t.float :latitude
      t.float :longitude
      t.text :description

      t.timestamps
    end
  end
end
