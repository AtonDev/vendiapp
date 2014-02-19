class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.belongs_to :item
    	t.timestamps
    end
  end

  def self.up
  	add_attachment :photo
  end

  def self.down
  	remove_attachment :photo
  end
end
