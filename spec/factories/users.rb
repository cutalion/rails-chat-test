FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "user#{n}" }
  end
end
