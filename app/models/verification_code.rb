class VerificationCode < ActiveRecord::Base
  validates :code, :presence => true, length: {is: 4}
end
