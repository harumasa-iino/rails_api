class User < ApplicationRecord
  has_many :social_profiles, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, :email, presence: true
end
