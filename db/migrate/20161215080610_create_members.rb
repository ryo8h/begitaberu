class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :user_name, null: false
      t.string :name, null: false
      t.string :password_digest, null: false
      t.string :email, null: false
      t.integer :gender, null: false, default: 0
      t.integer :age, null: false
      t.string :address, null: false
      t.boolean :user_type, default: false

      t.timestamps null: false
    end
  end
end