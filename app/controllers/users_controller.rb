class UsersController < ApplicationController
  # Setup accessible (or protected) attributes for your model
  # attr_accessible :title, :body

  def apply_omniauth(omniauth)
    self.email = omniauth['user_info']['email'] if email.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])

  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def show
    @user = User.find(current_user.id)
    puts @user.inspect 
  end

  def new
  	@user = User.new
  end

  def edit
  end

  def index
  end

  def employee
  end

  def jobseeker
  end


end