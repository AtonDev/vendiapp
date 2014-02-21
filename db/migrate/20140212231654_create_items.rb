class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.decimal :price_proposed
      t.decimal :price_sold
      t.string :title
      t.string :condition
      t.string :description
      t.boolean :has_arrived?
      t.belongs_to :owner
      t.belongs_to :seller
      t.timestamps
    end
  end
end
