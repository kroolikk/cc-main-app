class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :name
      t.string :image
      t.string :slug

      t.timestamps
    end
  end
end
