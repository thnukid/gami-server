# -*- encoding: utf-8 -*-
# stub: capistrano-sidekiq 0.3.8 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano-sidekiq"
  s.version = "0.3.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Abdelkader Boudih"]
  s.date = "2014-09-29"
  s.description = "Sidekiq integration for Capistrano"
  s.email = ["terminale@gmail.com"]
  s.files = [".gitignore", "Gemfile", "LICENSE.txt", "README.md", "Rakefile", "capistrano-sidekiq.gemspec", "lib/capistrano-sidekiq.rb", "lib/capistrano/sidekiq.rb", "lib/capistrano/sidekiq/monit.rb", "lib/capistrano/sidekiq/version.rb", "lib/capistrano/tasks/capistrano2.rb", "lib/capistrano/tasks/monit.cap", "lib/capistrano/tasks/sidekiq.cap", "lib/capistrano/templates/sidekiq_monit.conf.erb"]
  s.homepage = "https://github.com/seuros/capistrano-sidekiq"
  s.licenses = ["LGPL-3.0"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.2.2"
  s.summary = "Sidekiq integration for Capistrano"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>, [">= 0"])
      s.add_runtime_dependency(%q<sidekiq>, [">= 0"])
    else
      s.add_dependency(%q<capistrano>, [">= 0"])
      s.add_dependency(%q<sidekiq>, [">= 0"])
    end
  else
    s.add_dependency(%q<capistrano>, [">= 0"])
    s.add_dependency(%q<sidekiq>, [">= 0"])
  end
end
