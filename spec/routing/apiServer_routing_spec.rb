require "rails_helper"

RSpec.describe do
  it { should route(:post, 'api/events').to('api/events#create') }
end
