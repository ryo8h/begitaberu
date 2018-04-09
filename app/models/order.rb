class Order < ActiveRecord::Base
	has_one :past_order
	has_many :food_details
	has_many :food, through: :food_details

	belongs_to :member
	belongs_to :cart

end
