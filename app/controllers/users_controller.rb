class UsersController < ApplicationController
	# before_action :set_user, only: [:show, :edit, :update]

  def password_required?
   (authentications.empty? || !password.blank?) && super
  end

  def show
    puts "==========="
    puts user_signed_in?
    puts "==========="
    @user = User.find(current_user.id)
    role = current_user.role.first
  end

  def create
  	@user = User.new(user_params)
  end

  def new
  	@user = User.new(current_user.id)
  end

  def index
    @users = User.all
  end

  def employer
  	@user = User.new(params[:id])
  end

private

def user_params
	params.required(:users).permit(:role,:email)
end

end