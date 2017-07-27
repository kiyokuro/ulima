# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "example"
    email "example@example.com"
    slack_id "example"
    password "password"
    password_confirmation "password"
    admin false
    activated true
  end
  factory :user2, class: User do
    name "example"
    email "user2@example.com"
    slack_id "example"
    password "password"
    password_confirmation "password"
    admin false
    activated true
  end
end
