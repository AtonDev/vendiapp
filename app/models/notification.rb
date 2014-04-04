# == Schema Information
#
# Table name: notifications
#
#  content    :string(255)
#  created_at :datetime
#  id         :integer          not null, primary key
#  seller_id  :integer
#  updated_at :datetime
#

class Notification < ActiveRecord::Base
  belongs_to :seller
end
