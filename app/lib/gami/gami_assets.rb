require 'pry'
module Gami
  class GamiAssets 
    attr_accessor :badges, :assets_path

    def initialize(assets_path = nil)
      if assets_path
        @assets_path = assets_path
      else
        @assets_path = File.dirname(__FILE__) + "/assets/*.json"
      end

      @badges = {}
      load_assets
    end

    #The json has an array of values
    #An item is in best case a single word, it removes whitespaces
    #and looks up the value
    def find_badge(name)
      badge_name = name.delete(" ").downcase #delete whitespace
      return name unless badges.has_key?(badge_name)
      badges[badge_name] 
    end

    private
    def load_assets
      Dir.glob(assets_path) do |json_file|
        file = File.read json_file
        data_hash = JSON.parse(file, :quirks_mode => true)
        @badges.merge!(data_hash)
      end
    end
  end
end
