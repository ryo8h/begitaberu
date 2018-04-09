class Cart < ActiveRecord::Base
	has_many :orders
	has_many :cart_details
	has_many :foods, through: :cart_details

	belongs_to :member

end
