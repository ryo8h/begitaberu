class CartDetail < ActiveRecord::Base
	belongs_to :cart
	belongs_to :food
end
