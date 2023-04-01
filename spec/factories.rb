FactoryBot.define do
  factory :comment do
    title { "MyString" }
    message { "MyString" }
    company { nil }
    user { nil }
  end

  factory(:user) do
    email { Faker::Internet.email}
    password { Faker::Internet.password }
  end
end
