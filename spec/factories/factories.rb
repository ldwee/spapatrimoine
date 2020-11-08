FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "admin#{n}@example.com" }
    firstname { 'Admin First Name' }
    lastname { 'Admin Last Name' }
    password { '123123' }
  end

  factory :contributor do
    sequence(:email) { |n| "contributor#{n}@example.com" }
    firstname {'Contributor First Name'}
    lastname {'Contributor Last Name'}
  end

  factory :activity_type do
    title {'Activity type title'}
  end

  factory :activity_place do
    name {'Activity Place Name'}
    address {'Activity Place Address'}
  end

end
