class IncomingRequest < ApplicationRecord
  belongs_to :data_set
  #has_secure_token :uid
  before_create :set_uid

  private

  def set_uid
    self.uid = loop do
      temp = ULID.generate
      break temp unless IncomingRequest.exists?(uid: temp)
    end
  end
end
