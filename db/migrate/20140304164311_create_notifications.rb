class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
    	t.string :content
    	t.belongs_to :seller
      	t.timestamps
    end
  end
end
