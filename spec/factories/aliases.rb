# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :alias do
    username "MyString"
    email "MyString"
    user nil
  end
end
