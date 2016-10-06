require 'dynamize'
  
module Dynamize 
  module Padrino
    module Generators
      class Migration
        set :migrations_path, File.join(File.dirname(__FILE__), 'migrations')

        def create_migration
          register DynamoDB::Client
          register DynamoDB::Migration
        end
      end
    end
  end
end
