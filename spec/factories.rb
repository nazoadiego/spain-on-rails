FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    url { Faker::Internet.url }
    location { Companies::ListCompaniesLocationsUseCase.random }

    trait :with_comment do
      after(:build) do |company|
        comment = build(:comment, company: company)
        company.comments << comment
      end
    end

    trait :with_comments do
      after(:build) do |company|
        comments = build_list(:comment, 3, company: company)
        company.comments << comments
      end
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
