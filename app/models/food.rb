class Food < ActiveRecord::Base
	has_many :food_details
	has_many :orders, through: :cart_details
	has_many :cart_details
	has_many :carts, through: :cart_details
	has_one :image, class_name: "FoodImage", dependent: :destroy
	accepts_nested_attributes_for :image, allow_destroy: true


	class << self
		def search(query)
			rel = order("name")
			if query.present?
				rel = rel.where("name LIKE ?", "%#{query}%")
			end
			rel
		end
	end

end
