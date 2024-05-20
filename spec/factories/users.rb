FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "MyString#{n}" }
    sequence(:email) { |n| "user+#{n}@example.com" }
    crypted_password { "MyString" }
    salt { "MyString" }
  end
end
