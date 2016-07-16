class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :progess_id
      t.integer :duration
      t.text :achievement
      t.date :report_date

      t.timestamps null: false
    end
  end
end
