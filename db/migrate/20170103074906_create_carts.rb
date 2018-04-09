class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
    	t.references :member, null: false

      t.timestamps null: false
    end
    add_index :carts, :member_id
  end
end
