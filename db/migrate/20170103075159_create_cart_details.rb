class CreateCartDetails < ActiveRecord::Migration
  def change
    create_table :cart_details do |t|
    	t.references :cart, null: false
    	t.references :food, null: false
    	t.integer :quantity, default: 1
    	t.integer :subtotal

      t.timestamps null: false
    end

    add_index :cart_details, :cart_id
    add_index :cart_details, :food_id
  end
end
