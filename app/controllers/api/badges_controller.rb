module Api
  class BadgesController < ApplicationController
    skip_before_filter :verify_authenticity_token
    respond_to :json

    def index
      respond_with @user.badges.reverse_order, :only => [:name,:description,:picture,:hasEarned]
    end
  end
end
