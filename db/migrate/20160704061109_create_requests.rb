class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :request_type
      t.datetime :leave_from
      t.datetime :leave_to
      t.integer :status, default: 0
      t.text :reason
      t.datetime :compensation_time_from
      t.datetime :compensation_time_to

      t.timestamps null: false
    end
  end
end
