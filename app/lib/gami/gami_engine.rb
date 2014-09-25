module Gami
  class GamiEngine
    def self.run(event)
      @games = ['GitPush', 'GitCommit']
      @lookForEvent = event.name
      @user = event.user

      @games.each do |g|
        if(convert_event_to_class(@lookForEvent).include? @g.to_s)
          #class_send(convert_event_to_class(@lookForEvent),"perform_game", @user)
          #require_relative(convert_event_to_file(@lookForEvent))
          convert_event_to_class(@lookForEvent).constantize.perform_game(@user) if Object.const_defined?(convert_event_to_class(@lookForEvent))
          break
        end
      end

      #require_relative "games/"
      puts "I will be coordinating the gami games, yippi glockenbeat. #{event.inspect}"
    end

    #expect that the event is seperated by "{service}:{event}"
    def self.convert_event_to_class(event_name)
      event_name.titleize.tr(':','').prepend("Gami::")
    end

    def self.convert_event_to_file(event_name)
      event_name.downcase.tr(':','_').concat('.rb')
    end

    def self.class_send(class_name, method, *args)
        return nil unless Object.const_defined?(class_name)
        c = Object.const_get(class_name)
        c.respond_to?(method) ? c.send(method, *args) : nil
    end

  end
end


