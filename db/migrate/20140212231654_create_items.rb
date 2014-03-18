class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :condition
      t.string :description
      t.boolean :available, :default => true
      t.belongs_to :owner
      t.belongs_to :seller
      t.timestamps
    end
  end
end
