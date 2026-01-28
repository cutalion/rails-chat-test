FactoryBot.define do
  factory :administrator do
    sequence(:nickname) { |n| "admin#{n}" }
  end
end
