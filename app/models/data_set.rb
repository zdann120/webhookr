class DataSet < ApplicationRecord
  belongs_to :user
  has_many :incoming_requests
  has_secure_token :uid

end
