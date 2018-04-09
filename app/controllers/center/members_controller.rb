class Center::MembersController < Center::Base
  def index
  	@members = Member.where(user_type: false).order("id").paginate(page: params[:page], per_page: 10)
  end

  def edit
  end

  def update
  end
end
