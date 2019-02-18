class UsersController < ApplicationController
	# before_action :set_user, only: [:show, :edit, :update]

  def password_required?
   (authentications.empty? || !password.blank?) && super
  end

  def show
    @user = User.find(current_user.id)
    #puts @user.inspect 
  end

  def create
  	@user = User.new(user_params)
  end

  def new
  	@user = User.new
  end

  def index
    @users = User.all
  end

  def employer
  	@user = User.new(params[:id])
  end

private

def user_params
	params.required(:users).permit(:role.to_sym,:email)
end


end