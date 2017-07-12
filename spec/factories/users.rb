# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"
    slack_id "MyString"
    password_digest "MyString"
    remeber_digest "MyString"
    admin false
  end
end
