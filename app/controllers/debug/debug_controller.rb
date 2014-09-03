module Debug
  class DebugController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def events
        @event = Event.all
        render json: @event.to_json
    end

    def users
      @user = User.all
      render json: @user.to_json
    end
  end
end
