class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :social_profiles, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :api_keys, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true

  def grant_api_key
    return api_keys.valid_expire.first if api_keys.valid_expire.exists?
    
    api_keys.create
  end
end
