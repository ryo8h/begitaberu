class CreateFoodImages < ActiveRecord::Migration
  def change
    create_table :food_images do |t|
    	t.references :food, null: false
    	t.binary :data
    	t.string :content_type


      t.timestamps null: false
    end

    add_index :food_images, :food_id
  end
end
