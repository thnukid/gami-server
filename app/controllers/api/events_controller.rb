module Api
  class EventsController < ApplicationController
     skip_before_filter :verify_authenticity_token
    def create
      @event = Event.create_event_from_data(event_params)

      #start gami worker
      GamiWorker.perform_async(@event.id) unless @event.nil?

      return render :json => { :errors => 'user alias not found' }, :status => 422 if @event.nil?
      render json: @event.to_json
    end

    def event_params
      params.require(:event).permit(:name, :data, :email)
    end
  end
end
