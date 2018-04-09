class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.date :order_date
    	t.references :member, null: false

      t.timestamps null: false
    end
    add_index :orders, :member_id
  end
end
