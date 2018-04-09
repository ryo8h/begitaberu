class PastOrdersController < ApplicationController

  def index
  	if PastOrder.exists?(member_id: session[:member_id])
      @past_order = PastOrder.find_by(member_id: session[:member_id])
    else
      @past_order = nil
    end
  end

  def show
  end

  def new

  end

  def edit
  end
end
