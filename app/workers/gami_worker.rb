class GamiWorker
  include Sidekiq::Worker

  def perform(event_id)
    #find the event
    event = Event.find(event_id)

    #run the Gami Engine with event
    Gami::GamiEngine.run(event)

  end
end
