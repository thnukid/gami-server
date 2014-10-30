module Gami
  class Predication

    def self.build(options = {})
      @property = options[:using_property]
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
      49
    end
  end
end
