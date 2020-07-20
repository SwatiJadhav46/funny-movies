require 'faker'

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Internet.password }
    email { Faker::Internet.email }
  end

  factory :shared_video do
    url { 'https://www.youtube.com/watch?v=LXb3EKWsInQ' }
    title { Faker::Company.name }
    video_id { Faker::Internet.user_name }
    provider { 'YouTube' }
    description { Faker::Lorem.sentence(3)}
  end
end 