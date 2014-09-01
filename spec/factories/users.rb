# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "Hans.Musterman"
    email "MyString@musterman.com"
    password_digest "111111111111"
  end
end
