class Post < ApplicationRecord
  
  #:class_name => 'User', :foreign_key => 'User_id', :validates => true	
  default_scope -> { order(created_at: :desc) }
  # validates :user, presence: true

  belongs_to :user
  has_many :applieds 
  validates :post_title, :experience, :salary, Presence: true
end