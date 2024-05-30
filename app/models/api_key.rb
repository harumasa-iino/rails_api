class ApiKey < ApplicationRecord
  DEFAULT_EXPIRES_WEEK = 1.week
  belongs_to :user

  validates :access_token, uniqueness: true
  scope :valid_expire, -> { where('expires_at > ?', Time.current) }

  def initialize(attributes = {})
    super
    self.access_token = SecureRandom.urlsafe_base64
    self.expires_at = 1.week.from_now
  end
end
