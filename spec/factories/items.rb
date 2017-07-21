# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    name "apple"
    description "really red apple"
    price "150"
    quantity "1"
    show_enable true
    user_id "1"
  end
end
