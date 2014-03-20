class VerificationCode < ActiveRecord::Base
  validates :code, :presence => true, length: {is: 5}
end
