class Alias < ActiveRecord::Base
  belongs_to :user

  validates :username,:email,:user, presence: true
end
