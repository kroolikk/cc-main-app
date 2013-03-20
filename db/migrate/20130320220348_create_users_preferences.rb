class CreateUsersPreferences < ActiveRecord::Migration
  def change
    create_table :users_preferences do |t|
      t.string :user_id
      t.string :preference_id

      t.timestamps
    end
  end
end
