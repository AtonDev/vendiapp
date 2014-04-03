class AddPhonegapItemRefToImages < ActiveRecord::Migration
  def change
    add_reference :images, :phonegap_item, index: true
  end
end
