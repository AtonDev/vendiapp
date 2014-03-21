class CreateVerificationCodes < ActiveRecord::Migration
  def change
    create_table :verification_codes do |t|
      t.string :code
      t.timestamps
    end
  end
end
