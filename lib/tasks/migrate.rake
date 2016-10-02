namespace :dy  do
  desc "run dynamo migrations"
  task "migrate" => :environment do
  	puts 'implements...'
    # DynamoDB::Migration.run_all_migrations(options)
  end
end
# Rails.env
