class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_filter :find_user, :set_headers
  rescue_from Exception, :with => :error_render_method

    private
    def find_user
      return if params[:user_name].nil?
      @user = User.where('lower(username) = ?',params[:user_name].tr('+', ' ').downcase).first
    end

    def error_render_method
      respond_to do |type|
        type.all {render :json => {:errors => 'user not found'}, status: 422 }
      end
    end

    def set_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end

end
