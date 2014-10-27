module CreateGame
  @registry = [] 

  def self.define(&block)
    definition_proxy = DefinitionProxy.new
    definition_proxy.instance_eval(&block)
  end

  def self.registry
    @registry
  end
end


class DefinitionProxy
  def receive_badge badge, options = {}
    CreateGame.registry << badge.to_s
    #rules << options[:with_label]
    #rules << options[:using_property]
    #rules << options[:lteq]
  end
end
#receive_badge "Boarding", with_label: "Welcome, to the crew! ", using_property: "commit" , lteq: 1
#receive_badge "Boarding", with_label: "Welcome, to the crew! ", using_property: "commit" , lteq: 1
#receive_badge "Boarding", with_label: "Welcome, to the crew! ", using_property: "commit" , lteq: 1
  puts '###start dsl'
  load ('DSL_Game.rb')
  puts "###End Reading"

  #@rules.each do |x|
    #puts x.inspect
  #end
