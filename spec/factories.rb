FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    url { Faker::Internet.url }
    location { 'Madrid' }

    trait :with_comments do
      association :comment, factory: :comment
    end
  end

  factory :comment do
    title { "MyString" }
    message { Faker::TvShows::TwinPeaks.quote }
    association :company, factory: :company
    association :user, factory: :user
  end

  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :admin do
      admin { true }
    end
  end
end
