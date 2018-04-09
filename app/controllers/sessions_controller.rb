class SessionsController < ApplicationController

  def new
  end

  def create
  	member = Member.find_by(user_name: params[:session][:user_name])
  	if member && member.authenticate(params[:session][:password])
  	log_in member
  	redirect_to foods_path
  	else
  		flash.now[:danger] = "ユーザー名またはパスワードに誤りがあります"
  		render "new"
  	end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end

end
