require 'rolify'
class User < ApplicationRecord
  rolify :before_add => :before_add_method

  def before_add_method(role)
    # do something before it gets added
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
