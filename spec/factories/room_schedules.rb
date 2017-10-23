FactoryGirl.define do
  factory :room_schedule do
    user_id 1
    room_id 1
    description Faker::Lorem.sentence
		starts_at "#{Time.now.strftime('%Y-%m-%d')} 16:00:00"
		ends_at "#{Time.now.strftime('%Y-%m-%d')} 17:00:00"
  end
end
