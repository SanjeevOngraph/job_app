class Post < ApplicationRecord
  belongs_to :user :class_name => 'User', :foreign_key => 'User_id'
  validates :user, presence: true
  resourcify

end
