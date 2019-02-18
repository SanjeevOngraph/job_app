require 'rolify'

class User < ApplicationRecord
  rolify :before_add => :before_add_method

   enum role: [:employer,:jobseeker]
   has_many :post, :foreign_key => 'User_id' 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable


  def before_add_method(role)
    self.add_role(role)
  end

  after_create :assign_role

  def assign_default_role
  	self.add_role(:newuser) if self.roles.blank?
  end

  def assign_role
  	self.add_role(params[:role])
  end

end
