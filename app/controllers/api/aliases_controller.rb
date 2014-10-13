module Api
  class AliasesController < ApplicationController
    skip_before_filter :verify_authenticity_token
    respond_to :json

    def index
     respond_with @user.aliases, :only => [:username,:email]
    end
  end
end
