require 'dynamize'

module Dynamize
  class Railtie < Rails::Railtie
    rake_tasks do
      require "tasks/migrate"
    end
  end
end
