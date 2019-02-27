class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :post_title, null: false, limit: 72
      t.string :experience
      t.string :salary
      t.references :user, foreign_key: true, null: false, index: true
      t.timestamps
    end
  end
end
