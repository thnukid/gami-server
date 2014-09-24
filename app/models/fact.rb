class Fact < ActiveRecord::Base
  belongs_to :user

  validates :user, :aggregated_fact_name, :value, presence:true 
  validates_uniqueness_of :aggregated_fact_name, scope: :user

  def self.aggregate_for_user(user, fact_name, value)
    fact_exists = Fact.where(user: user, aggregated_fact_name: fact_name).first

    return Fact.create user: user, aggregated_fact_name: fact_name, value: value unless fact_exists

    fact_exists.update_attribute(:value, fact_exists.value += value)
  end
end
