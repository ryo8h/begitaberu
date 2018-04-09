class MembersController < ApplicationController
 # before_action :set_member, except: [:index]

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])
  end

  # GET /members/new
  def new
    @member = Member.new(user_type: true)
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end


  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    if @member.save
      log_in @member
      flash[:success] = "ログイン成功"
      redirect_to @member
    else
      render "new"
    end
=begin
    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(member_params)
    if @member.save
      redirect_to @member, notice: "会員情報を更新しました。"
    else
      render "edit"
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: '退会しました' }
      format.json { head :no_content }
    end
  end


  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:user_name, :name, :password, :email, :gender, :age, :address, :center_id)
    end
end