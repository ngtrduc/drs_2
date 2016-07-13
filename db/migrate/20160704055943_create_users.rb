class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :is_admin
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
