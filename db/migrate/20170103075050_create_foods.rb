class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
    	t.string :name, null: false
    	t.integer :price, null: false
    	t.date :sale_start, null: false
    	t.date :sale_end, null: false
    	t.integer :stock, null: false
    	t.string :locality, null: false
    	t.string :detail, null: false
    	t.string :producer, null: false
    	t.date :havest_date, null: false

      t.timestamps null: false
    end
  end
end
