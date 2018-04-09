class Center::OrdersController < Center::Base
	require 'date'

  def index
  	@orders = Order.all
  end

  def submit
  	@past_order =PastOrder.new
  	@past_order.member_id = params[:member_id]
  	@past_order.order_id = params[:order_id]
  	@past_order.delivery_date = Time.now
  	@past_order.save

  	@order_detail = OrderDetail.find(params[:order_detail_id])
  	@order_detail.reserve = true
  	@order_detail.save
  	flash[:sendfood] = "配達しました。"
  	redirect_to :back
  end
end
