class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.attachment :avatar
      t.string :uid
      t.references :user, index: true, foreign_key: true
      t.integer :position_id
      t.integer :skill_id
      t.integer :division_id

      t.timestamps null: false
    end
  end
end
