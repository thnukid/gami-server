class Fact < ActiveRecord::Base
  belongs_to :user


  validates :user, :aggregated_fact_name, :value, presence:true 
end
