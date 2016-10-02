require 'dynamize'
require 'rails'
module Dynamize
  class Railtie < Rails::Railtie
    rake_tasks do
      require '../tasks/migrate.rake'
    end
  end
end
