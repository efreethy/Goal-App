class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :user_id, null: false
      t.string :status, null: false, default: "Incomplete"
      t.string :permission, null: false, default: "Public"

      t.timestamps null: false
    end

    add_index :goals, :user_id
  end
end
