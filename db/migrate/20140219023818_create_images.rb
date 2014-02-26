class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.belongs_to :item
      	t.attachment :photo
    	t.timestamps
    end
  end
end
