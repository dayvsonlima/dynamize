namespace :dy do
  desc "run dynamo migrations"
  task "migrate" => :environment do
  	puts 'implements...'
    puts DynamoDB::Migration.run_all_migrations(Dynamize::DYNAMODB_OPTIONS)
  end
end

