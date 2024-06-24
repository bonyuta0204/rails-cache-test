namespace :ridgepole do
    desc "Apply Ridgepole"
    task apply: :environment do
      connection_setting = Rails.configuration.database_configuration[Rails.env]
      client = Ridgepole::Client.new(connection_setting)
  
      schema_file = Rails.root.join('db/Schemafile')
      dsl = File.read(schema_file)
      delta = client.diff(dsl)
  
      if delta.differ?
        delta.migrate
      end
    end
  end