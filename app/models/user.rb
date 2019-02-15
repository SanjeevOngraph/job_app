require 'rolify'
class User < ApplicationRecord
  rolify :before_add => :before_add_method

   # has_secure_password
   has_many :post # add this


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  def before_add_method(role)
    # do something before it gets added
  end

  after_create :assign_role

  def assign_default_role
  	self.add_role(:newuser) if self.roles.blank?
  end

  def assign_role
  	self.add_role(:jobseeker)
  end

end
