class CreatePastOrders < ActiveRecord::Migration
  def change
    create_table :past_orders do |t|
    	t.references :member, null: false
	    t.references :order, null: false
    	t.date :delivery_date

      t.timestamps null: false
    end

    add_index :past_orders, :member_id
    add_index :past_orders, :order_id
  end
end
