  require 'rolify'

class User < ApplicationRecord
  #rolify :before_add => :before_add_method
  has_many :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

end
