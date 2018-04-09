class Center::Base < ApplicationController
  before_action :center_login_required

  private
  def center_login_required
    raise Forbidden unless current_member.try(:user_type?)
  end
end
