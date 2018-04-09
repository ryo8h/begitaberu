class Center::FoodsController < Center::Base
  def index
  end

  def show
  end

  def new
    @food = Food.new
  end

  def edit
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to @food
    else
      render "new"
    end
  end

  def update
  end

  def destroy
    puts "-------------------------"
    puts params[:food_id]
    puts params[:id]
    puts "----------------------"
    @food = Food.find(params[:id])
    @food.destroy
    flash[:delete] = @food.name + "を削除しました"
    redirect_to foods_path
  end

  private
    def member_params
      attrs = [:name, :price, :sale_start, :sale_end, :stock, 
                                    :locality, :detail, :producer, :havest_date]
      attrs << {image_attributes: [:_destroy, :id, :uploaded_image]}
      params.require(:food).permit()
    end
end
