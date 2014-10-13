module Api
  class ApiController < ApplicationController
    skip_before_filter :verify_authenticity_token
    before_action :set_headers, :set_user

    def index
      return render :json => { :errors => 'user not found' }, :status => 422 if @currentUser.nil?
    end


    def user
      return render :json => { :errors => 'user not found' }, :status => 422 if @currentUser.nil?
      render json: @currentUser.as_json(:only => [:username,:email])
    end


    def badges
      return render :json => { :errors => 'user not found' }, :status => 422 if @currentUser.nil?
      render json: @currentUser.badges.all.reverse_order.to_json(:only => [:name, :description, :picture])
    end

    def aliases
      return render :json => { :errors => 'user not found' }, :status => 422 if @currentUser.nil?
      render json: @currentUser.aliases.all.reverse_order.to_json(:only => [:username, :email])
    end

    private
    def set_user
      return if params[:username].nil?
      username = params[:username].tr('+',' ').downcase
      @currentUser = User.where('lower(username) = ?', username).first
    end

    def set_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end

  end
end
