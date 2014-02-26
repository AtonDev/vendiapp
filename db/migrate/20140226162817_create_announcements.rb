class CreateAnnouncements < ActiveRecord::Migration
  	def change
    	create_table :announcements do |t|
    		t.string :content
    		t.belongs_to :item
    		t.integer :receiver_id
    		t.string :receiver_type #seller, owner, admin
      		t.timestamps
    	end
    	add_index :announcements, :receiver_id
  	end
end
