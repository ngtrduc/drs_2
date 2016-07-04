class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :type
      t.datetime :leave_from
      t.datetime :leave_to
      t.boolean :approved, default: false
      t.text :reason

      t.timestamps null: false
    end
  end
end
