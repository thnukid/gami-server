module Gami
  class Predication

    def build(options = {})
      return condition(options)
    end

    def condition(options = {})
      options.keys.each do |elm|
        case elm.to_s
        when 'contains'
          return Proc.new { |property_value|
            if property_value.present? && options[:contains].present?
              property_value =~ options[:contains]
            else
              false
            end
          }
        when 'gteq'
          return Proc.new { |property_value|
            if property_value.present? && options[:gteq].present?
              property_value >= options[:gteq]
            else
              false
            end
          }
        end
      end
    end

  end
end
