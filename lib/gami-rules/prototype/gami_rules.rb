module Gami

  class Rule
    attr_accessor :event, :badge, :block
    attr_writer :rules

    def applies?
      is_true = true #always true, without block
      unless self.block.nil?
        is_true = self.block.call #is it true?
      end
    end

    def to_s
       "on #{event}, assign #{badge}, evaluate #{block} = #{self.applies?}"
    end

  end

  module Rules
    def when_a(action,badge,&block)
      
      rules[action] ||= []

      rule = Rule.new
      rule.action = action
      rule.badge = badge
      rule.block = block

      all_rules[action] << rule
      puts all_rules.inspect
    end

    def all_rules
      @all_rules ||= {}
    end
  end

end


#Rules.when_a 'git#push','Push Beginner' do
      ##data['commits'][0]['committer']['username'] == "thnukid"
      #true
    #end

    #Rules.when_a 'git#push','Push Beginner' do
      ##data['commits'][0]['committer']['username'] == "thnukid"
      #true
   #end


