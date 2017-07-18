# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "example"
    email "example@example.com"
    slack_id "example"
    password "password"
    password_confirmation "password"
    admin false
  end
end
