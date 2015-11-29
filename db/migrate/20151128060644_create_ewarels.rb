class CreateEwarels < ActiveRecord::Migration
  def change
    create_table :ewarels do |t|
			t.string :url
			t.boolean :is_public

      t.timestamps null: false
    end
  end
end
