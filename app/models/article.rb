class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  enum status: { draft: 0, in_review: 10, published: 20, archived: 30 }
  validates :user, :title, :status, presence: true
end
