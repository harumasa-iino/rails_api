class ApiKey < ApplicationRecord
  DEFAULT_EXPIRES_WEEK = 1.week
  belongs_to :user

  validates :access_token, uniqueness: true
end
