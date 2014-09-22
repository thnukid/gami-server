class Fact < ActiveRecord::Base
  belongs_to :user

  def self.aggregate_for_user(user, fact_name, value)
    return Fact.create user: user, aggregated_fact_name: fact_name, value: value
  end

  validates :user, :aggregated_fact_name, :value, presence:true 
end
