module Debug
  class DebugController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def events
        @event = Event.all
        render json: @event.reverse_order.to_json
    end

    def alias
      @alias = Alias.all
      render json: @alias.reverse_order.to_json
    end

    def users
      @user = User.all
      render json: @user.reverse_order.to_json
    end
  end
end
