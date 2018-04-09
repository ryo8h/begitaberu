class TopController < ApplicationController
  before_action :get_back


  def index
  end

  def backpage
  	return_back and return
  end


  private
    def  get_back
    	if session[:request_from]
      	@request_from = session[:request_from]
    	end
    	session[:request_from] = request.original_url
    end

		def return_back
    	if request.referer
      	redirect_to :back and return true
    	elsif @request_from
      	redirect_to @request_from and return true
    	end
    end
end
