class User < ActiveRecord::Base
  has_many :alias
  has_many :events
  has_many :badges
end
