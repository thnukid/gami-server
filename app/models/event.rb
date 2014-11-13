class Event < ActiveRecord::Base
  belongs_to :user
  validates :name, :user, presence:true

  def self.create_event_from_data(data)
    user_alias = Alias.where(email: data[:email]).first
    return if user_alias.nil?
    user_alias.user.events.create user: user_alias.user, name: data[:name], data: data[:data]
  end

  def aggregate_properties(properties)
    properties.each do |property|
      Fact.aggregate_for_user(user, property, parsed_data['game'][property]) if parsed_data['game'].has_key?(property)
    end
  end

  def parsed_data
    @parsed_data ||= JSON.parse(data)
  end
end
