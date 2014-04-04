# == Schema Information
#
# Table name: sellers
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  phone_number           :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class Seller < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :first_name, :presence => true, :format => { with: /\w+/, message: "should contain only letter characters" }  
  validates :last_name, :presence => true, :format => { with: /\w+/, message: "should contain only letter characters" }  
  validates :phone_number, :presence => true, :uniqueness => true, :length => {:minimum => 10, :maximum => 15}, :format => { with: /\d{3}-\d{3}-\d{4}/, message: "should have this format: 123-456-7890" }

  has_many :items
  has_many :price_proposals, dependent: :destroy
  has_many :notifications, dependent: :destroy

end
