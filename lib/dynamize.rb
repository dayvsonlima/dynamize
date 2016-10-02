require 'aws-sdk'
require 'dynamoid'
require 'dynamodb/migration'

module Dynamize
  # require "lib/dynamize/railtie" if defined?(Rails)

  Dynamoid.configure do |config|
    config.adapter = 'aws_sdk_v2' # This adapter establishes a connection to the DynamoDB servers using Amazon's own AWS gem.
    config.namespace = "dynamoid_app_development" # To namespace tables created by Dynamoid from other tables you might have. Set to nil to avoid namespacing.
    config.warn_on_scan = true # Output a warning to the logger when you perform a scan rather than a query on a table.
    config.read_capacity = 5 # Read capacity for your tables
    config.write_capacity = 5 # Write capacity for your tables
    config.endpoint = 'http://localhost:8000' # [Optional]. If provided, it communicates with the DB listening at the endpoint. This is useful for testing with [Amazon Local DB] (http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html).
  end

  Aws.config.update({
    region: "us-west-2",
    endpoint: "http://localhost:8000"
  })

  dynamodb_client = Aws::DynamoDB::Client.new

  DYNAMODB_OPTIONS = {
    client: dynamodb_client,           # an Aws::DynamoDB::Client instance
    path: "#{Rails.root}/migrations", # the full path to the folder where your migration classes will live
    migration_table_name: 'migrations' # optional, the name of the table to use for migrations, default is "migrations"
  }

  DynamoDB::Migration.run_all_migrations(DYNAMODB_OPTIONS)

  # basic rake loader
  Dir["lib/tasks/**/*.rake"].each { |ext| load ext } if defined?(Rake)
end
