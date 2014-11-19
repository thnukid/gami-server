class User < ActiveRecord::Base
  has_many :aliases
  has_many :events
  has_many :badges
  has_many :facts

  validates :username,:email, presence: true
  validates_uniqueness_of :email, scope: [:username]
  validates :password_digest, presence: true, length: {minimum: 8}
end
