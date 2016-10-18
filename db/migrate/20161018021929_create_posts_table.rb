class CreatePostsTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :posts do |t|
      t.string :username
      t.text :post
      t.datetime :timestamp
    end
  end
end
