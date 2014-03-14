class CreateSaleInfos < ActiveRecord::Migration
	def change
		create_table :sale_infos do |t|
			t.belongs_to :item
			t.decimal :proposed_price
			t.decimal :price_sold
			t.date :start_sale
			t.boolean :has_sold, :default => false
			t.boolean :currently_selling, :default => false
			t.timestamps
		end
	end
end
