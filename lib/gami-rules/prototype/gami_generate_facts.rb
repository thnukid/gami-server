require 'json'
class GenerateFacts
  attr_accessor :raw, :facts
  def initialize
    @raw = Array.new(0) #create a array
    @facts = Hash.new(0) #create a hash 
  end
  def build
    #build the fact hash
    #identify keys and add them to the fact hash
    
    test = get_keys(@raw[0])
    test2 = get_keys(@raw[1])

    @facts = recurse_merge(test,test2)
    p @facts
    p @facts[:head_commit][:message].uniq.count
    p test[:head_commit][:message]
    p test2[:head_commit][:message]
    p @facts[:pusher][:name].uniq.count
  end

    def recurse_merge(a,b)
      a.merge(b) do |_,x,y|
        (x.is_a?(Hash) && y.is_a?(Hash)) ? recurse_merge(x,y) : [*x,*y]
      end
    end

    def get_keys(h)
    new_hash = {}
    h.each do |k,v|
      if v.class == String || v.class == Fixnum || v.class == Float 
        new_hash[k.to_sym] = v
      elsif v.class == Hash
        new_hash[k.to_sym] = get_keys(v)
      elsif v.class == Array
       new_hash[k.to_sym] = get_keys_array(v)
      end
    end
    return new_hash
  end

  def get_keys_array(array)
    new_array = []
    array.each do |i|
      if i.class == Hash
        new_array << get_keys(i)
      elsif i.class == Array
        new_array << get_keys_array(i)
      end
    end
    return new_array
  end
  
  def loadFake
    #loads some fake data from fixture
    json_file = open("../../spec/fixtures/github_payload.json").read
    json_data = JSON.parse(json_file)
    
    json_fil = open("../../spec/fixtures/github_payload_2.json").read
    json_dat = JSON.parse(json_fil)
    #(0..5).each do |i|
      @raw[0] = json_data
      @raw[1] = json_dat
    #end
  end
end
    #@payload = open("../../spec/fixtures/github_payload.json").read
    #@fact = JSON.load(@payload)

fact = GenerateFacts.new
fact.loadFake
fact.build


