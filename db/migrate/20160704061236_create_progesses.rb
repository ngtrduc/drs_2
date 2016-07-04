class CreateProgesses < ActiveRecord::Migration
  def change
    create_table :progesses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
