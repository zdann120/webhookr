class IncomingRequest < ApplicationRecord
  belongs_to :data_set
  has_secure_token :uid
end
