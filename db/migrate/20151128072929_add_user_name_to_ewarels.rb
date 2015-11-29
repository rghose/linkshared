class AddUserNameToEwarels < ActiveRecord::Migration
  def change
		add_column :ewarels, :user_id, :integer
  end
end
