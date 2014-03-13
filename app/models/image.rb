# == Schema Information
#
# Table name: images
#
#  created_at         :datetime
#  id                 :integer          not null, primary key
#  item_id            :integer
#  photo_content_type :string(255)
#  photo_file_name    :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  updated_at         :datetime
#

class Image < ActiveRecord::Base
	belongs_to :item
	has_attached_file :photo, styles: {
		thumb: '100x100>',
		square: '200x200#',
		medium: '300x300>'
	},
	:storage => "s3", :s3_credentials => S3_CREDENTIALS

	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

end
