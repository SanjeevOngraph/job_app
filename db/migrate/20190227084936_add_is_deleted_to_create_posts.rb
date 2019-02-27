class AddIsDeletedToCreatePosts < ActiveRecord::Migration[5.2]
  def change
  	add_column :posts, :is_deleted, :boolean, default: false
  end
end
