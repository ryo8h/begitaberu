class OrdersController < ApplicationController
  require 'date'

  def index
    if Order.exists?(member_id: session[:member_id])
      @order = Order.find_by(member_id: session[:member_id])
      @order_details = OrderDetail.where(order_id: @order.id).paginate(page: params[:page], per_page: 10)
    else
      @orders = nil
    end
  end

  def new
  end

  def create
    if Order.find_by(member: session[:member_id]) == nil
      @order = Order.new
      @order.member_id = session[:member_id]
      @order.order_date = Time.now
      @order.save
    end
    @order = Order.find_by(member: session[:member_id])
    @food = Food.find(params[:food_id])
    @order_detail = OrderDetail.new
    @order_detail.order_id = @order.id
    @order_detail.food_id = @food.id
    @order_detail.subtotal = @food.price.to_i * params[:quantity].to_i
    @order_detail.quantity = params[:quantity]
    @order_detail.save

    @food.stock = ( @food.stock - params[:quantity].to_i).to_s
    @food.save

    @cart_detail = CartDetail.find(params[:cart_detail_id])
    @cart_detail.delete
    flash[:justorder] = @food.name + "注文が完了しました。"

    redirect_to carts_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
