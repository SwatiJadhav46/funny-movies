FactoryBot.define do
  factory :shared_video, class: :user do
    url { 'https://www.youtube.com/watch?v=LXb3EKWsInQ' }
    title { Faker::Company.name }
    video_id { Faker::Internet.user_name }
    provider { 'YouTube' }
    description { Faker::Lorem.sentence(3)}
    user_id {''}
  end
end
