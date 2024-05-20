class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :article
    validates :article, :user, presence: true
end
