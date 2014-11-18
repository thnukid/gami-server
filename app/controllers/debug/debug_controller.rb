module Debug
  class DebugController < ApplicationController
    skip_before_filter :verify_authenticity_token
    before_action :set_headers

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
    def badge
      @badge = Badge.all
      render json: @badge.reverse_order.to_json
    end

    def fact
      @fact = Fact.all
      render json: @fact.reverse_order.to_json
    end
    private
    def set_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
  end
end
