FactoryGirl.define do
  factory :room do
		name Faker::Lorem.sentence
		description Faker::Lorem.sentence
		location Faker::Lorem.sentence
  end
end
