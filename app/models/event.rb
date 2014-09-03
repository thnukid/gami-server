class Event < ActiveRecord::Base
  belongs_to :user

  def self.create_event_from_data(data)
    user_alias = Alias.where(email: data[:email]).first
    return render :json => { :errors => @model.errors }, :status => 422 if user_alias.nil?
    user_alias.user.events.create user: user_alias.user, name: data[:name], data: data[:data]
  end

  validates :name, :user, presence:true
end
