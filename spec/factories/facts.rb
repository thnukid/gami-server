# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fact do
    user nil
    aggregated_fact_name "MyString"
    value 1
  end
end
