class DataSet < ApplicationRecord
  belongs_to :user
  has_secure_token :uid
end
