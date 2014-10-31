module Gami
  class Predication

    def build(options = {})
      @property = options[:using_property]
      #@event = event
      binding.pry
      return condition(options)
    end

    def condition(options = {})
      property_value = value_for(@property)

      options.keys.each do |elm|
        case elm.to_s
        when 'lteq'
          return Proc.new {
            options[:lteq] <= property_value
          }
        end
      end
    end

    #returns the fact from the database
    def value_for(prop)
      #Fact.where(value: prop).first
      10
    end
  end
end
