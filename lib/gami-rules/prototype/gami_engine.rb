require './gami_facts'
require './gami_rules'
require 'json'

module Gami
  class Engine
    def initialize(facts,rules)
      @facts = facts
      @rules = rules
      @result = {}
    end
    def validate
      @rules.each do |r|
        puts "is_true: #{r.applies?.class} on #{r.event} with #{r.badge}"
      end
    end
    def info
      "Gami has #{@facts.count} facts, and #{@rules.count} rules"
    end
  end
end

puts 'I am Gami Rule Engine'

#some data
payload = open("../../spec/fixtures/github_payload.json").read
data = JSON.parse(payload)

#some rule
r = Gami::Rule.new 'git#push','Push Beginner' do
  data['commits'][0]['committer']['username'] == "thnukid"
end
r = Gami::Rule.new 'git#push','Push Beginner' do
  data['commits'][0]['committer']['username'] == "thnukid"
puts r.applies?
puts r.description?
