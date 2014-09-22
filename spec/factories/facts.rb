# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fact do
    user
    aggregated_fact_name "git_commit_count"
    value 10
  end
end
