# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "git:commit"
    data "{data: 1}"
    user
  end

  factory :invalid_event, parent: :event do
    user nil
  end

end
