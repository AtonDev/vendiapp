class AddIndexToSellers < ActiveRecord::Migration
  def change
  	add_index :sellers, :phone_number, :unique => true
  end
end
