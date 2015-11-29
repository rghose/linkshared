class FriendLinksAssociation < ActiveRecord::Migration
  def change
		create_table :friend_links do |t|
			t.integer :user_id
			t.integer :link_id
		end
  end
end
