class ArticleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :contents, :status
  has_many :comments
  belongs_to :user
end
