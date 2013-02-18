FactoryGirl.define do
  factory :user do
    first_name "Michael"
    last_name "Hartl"
    email "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
  
  factory :roll do
    amount 123.45
    user
  end
  
  factory :game do
    amount 12.32
    user
  end
end