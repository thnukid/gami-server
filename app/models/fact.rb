class Fact < ActiveRecord::Base
  belongs_to :user

  validates :user, :aggregated_fact_name, :value, presence:true 
  validates_uniqueness_of :aggregated_fact_name, scope: :user

  def self.aggregate_for_user(user, fact_name, value)
    fact_exists = Fact.where(user: user, aggregated_fact_name: fact_name).first

    unless fact_exists
      new_fact = Fact.create user: user, aggregated_fact_name: fact_name, value: value
      return new_fact.value
    else
      fact_exists.update_attribute(:value, fact_exists.value += value)
      return fact_exists.value
    end

    #return the value of the fact, for comparison in rule
  end
end
