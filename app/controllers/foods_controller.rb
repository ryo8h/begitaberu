class FoodsController < ApplicationController

  def index
  	@foods = Food.order("price").paginate(page: params[:page], per_page: 10)
  	if params[:format].in?(["jpg", "png", "gif"])
      send_image
  	end
  end

  def show
  	@food = Food.find(params[:id])
  	if params[:format].in?(["jpg", "png", "gif"])
  		send_image
  	end
  end

  def search
    @foods = Food.search(params[:q]).paginate(page: params[:page], per_page: 10)
    render "index"
  end

	private
		def send_image
			if @food.image.present?
				send_data @food.image.data,
				 type: @food.image.content_type, disposition: "inline"
			else
				raise NotFound
			end
		end
end
