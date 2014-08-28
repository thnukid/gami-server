class User < ActiveRecord::Base
  has_many :aliases
  has_many :events
  has_many :badges

  validates :username,:email, presence: true
  validates_uniqueness_of :username, :email
  validates :password_digest, presence: true, length: {minimum: 8}
end
