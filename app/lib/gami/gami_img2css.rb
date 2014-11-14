module Gami
  class GamiImg2css
    attr_reader :badge_css
    def self.translateImg(badge_name)
      badges ||= badges_css #get array with defined badges 2 css
      b = badge_name.delete(" ") #delete whitespace
      badges[b.to_sym] if badges.has_key?(b.to_sym)
      'http://placekitten.com/164/164' #return kitten if not found
    end
    def self.badges_css
      {
        :firststar  => self.create_b('star-o'),
        :secondstar  => self.create_b('star-half-o'),
        :stars  => self.create_b('star'),
        :takeoff  => self.create_b('space-shuttle'),
        :indispensable => self.create_b('github-alt'),
        :boarding => self.create_b('child'),
        :intern => self.create_b('university'),
        :apprenticeships => self.create_b('keyboard-o'),
        :junior => self.create_b('graduation-cap'),
        :senior => self.create_b('terminal'),
        :pwnage => self.create_b('github-alt')
      }
    end

    def self.create_b(icon)
      sprintf('<span class="fa-stack fa-5x"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-%s fa-stack-1x"></i></span>', icon)
    end
  end
end
