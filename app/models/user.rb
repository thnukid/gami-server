class User < ActiveRecord::Base
  has_many :aliases
  has_many :events
  has_many :badges
end
