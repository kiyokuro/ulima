# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString@a.com"
    slack_id "MyString"
    password "password"
    password_confirmation "password"
    admin false
  end
end
