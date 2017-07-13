# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString@a.com"
    slack_id "MyString"
    password_digest "MyString"
    remember_digest "MyString"
    admin false
  end
end
