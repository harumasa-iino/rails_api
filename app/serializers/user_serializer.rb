class UserSerializer
  include FastJsonapi::ObjectSerializer
  has_many :articles
  attributes :name, :email, :password
end
