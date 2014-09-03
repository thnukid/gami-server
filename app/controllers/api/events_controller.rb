module Api
  class EventsController < ApplicationController
     skip_before_filter :verify_authenticity_token
    def create
      @event = Event.create_event_from_data(event_params)
      return render :json => { :errors => 'could not found user' }, :status => 422 if @event.nil?
      render json: @event.to_json
    end

    def index
      @event = Event.all
      render json: @event.to_json
    end

    def event_params
      params.require(:event).permit(:name, :data, :email)
    end
  end
end
