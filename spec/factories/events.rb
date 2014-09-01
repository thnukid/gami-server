# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :event do
    name "MyString"
    data "MyString"
    user
  end

  factory :invalid_event, parent: :event do
    user nil
  end
end
