# Model to represent a golfer
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :scores, dependent: :destroy

  def serialize_user
    {
      id: id,
      name: name,
      scores: scores
    }
  end
end
