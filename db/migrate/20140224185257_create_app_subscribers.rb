class CreateAppSubscribers < ActiveRecord::Migration
  def change
    create_table :app_subscribers do |t|
      t.string :email
      t.timestamps
    end
    add_index :app_subscribers, :email, unique: true
  end
end
