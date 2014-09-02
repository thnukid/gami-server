module Api
  class EventsController < ApplicationController
     skip_before_filter :verify_authenticity_token
    def create
      @event = Event.create_event_from_data(event_params)
      render json: @event.to_json
    end

    def index
      render html: "Oki Doki Cowboy".html_safe
    end

    def event_params
      params.require(:event).permit(:name, :data, :email)
    end
  end
end
