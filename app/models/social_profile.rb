class SocialProfile < ApplicationRecord
  belongs_to :user

  validates :provider, :uid, :user, presence: true
end
