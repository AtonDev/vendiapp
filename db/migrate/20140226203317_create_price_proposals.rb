class CreatePriceProposals < ActiveRecord::Migration
	def change
		create_table :price_proposals do |t|
			t.belongs_to :seller
			t.belongs_to :item
			t.decimal :price
			t.timestamps
		end
	end
end
