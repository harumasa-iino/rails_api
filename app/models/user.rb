class User < ApplicationRecord
    has_many :social_profiles, dependent: :destroy
    has_many :articles
    has_many :comments

    validates :name, :email, presence: true
end
