class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
    	t.references :order, null: false
    	t.references :food, null: false
    	t.integer :quantity
    	t.integer :subtotal
    	t.boolean :reserve, default: false

      t.timestamps null: false
    end

    add_index :order_details, :order_id
    add_index :order_details, :food_id
  end
end
