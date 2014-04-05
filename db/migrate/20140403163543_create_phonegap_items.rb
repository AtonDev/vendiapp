class CreatePhonegapItems < ActiveRecord::Migration
  def change
    create_table :phonegap_items do |t|
      t.string :title
      t.string :condition
      t.string :description
      t.string :owners_email
      t.string :owners_name
      t.timestamps
    end
  end
end
