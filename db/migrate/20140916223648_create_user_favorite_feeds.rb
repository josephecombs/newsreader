class CreateUserFavoriteFeeds < ActiveRecord::Migration
  def change
    create_table :user_favorite_feeds do |t|
      t.integer :user_id, null: false
      t.integer :feed_id, null: false

      t.timestamps
    end
    
    add_index :user_favorite_feeds, :user_id
    add_index :user_favorite_feeds, :feed_id
    add_index :user_favorite_feeds, [:user_id, :feed_id], unique: true

  end
end
