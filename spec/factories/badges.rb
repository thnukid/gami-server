# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :badge do
    name "MyString"
    description "MyString"
    picture "MyString"
    user nil
  end
end
