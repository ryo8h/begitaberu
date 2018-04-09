class CartsController < ApplicationController

  def index
    if Cart.exists?(member: session[:member_id])
      @cart = Cart.find_by(member: session[:member_id])
      @cart_details = CartDetail.where(cart_id: @cart.id).paginate(page: params[:page], per_page: 10)
    else
      @cart_details = nil
    end
  end


  def new
  	if @cart = Cart.find_by(member: session[:member_id])
      @food = Food.find(session[:food_id])
      if CartDetail.exists?(cart_id: session[:member_id], food_id: session[:food_id])
        flash[:addcart] = food.name + "は既にカートにあります。"
      else
        @cart_detail = CartDetail.new
        @cart_detail.cart_id = @cart.id
        @cart_detail.food_id = session[:food_id]
        @cart_detail.subtotal = @food.price
        @cart_detail.quantity = 1
        @cart_detail.save
        flash[:addcart] = @food.name + "をカートに入れました。"
      end
      redirect_to :back
  	else
  		@cart = Cart.new(member: current_member)
      @cart.save
  		redirect_to action: "new"
  	end
  end

  def create
  end

  def cancel
    @cart_detail = CartDetail.find(params[:cart_detail_id])
    @cart_detail.delete
    flash[:justorder] = params[:food_name] + "をカートから削除しました"
    redirect_to foods_path
  end

  def destroy
  end

  private
  	def food_params
      params.require(:food).permit(:name, :price, :sale_start, :sale_end,
       :stock, :locality, :detail, :producer, :havest_date) 
    end

end
