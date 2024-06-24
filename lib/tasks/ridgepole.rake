# frozen_string_literal: true

namespace :ridgepole do
  desc 'Apply Ridgepole'
  task apply: :environment do
    connection_setting = Rails.configuration.database_configuration[Rails.env]
    client = Ridgepole::Client.new(connection_setting)

    schema_file = Rails.root.join('db/Schemafile')
    dsl = File.read(schema_file)
    delta = client.diff(dsl)

    delta.migrate if delta.differ?
  end

  desc 'export plan'
  task export_plan: :environment do
    connection_setting = Rails.configuration.database_configuration[Rails.env]
    client = Ridgepole::Client.new(connection_setting)

    Ridgepole::Logger.instance.level = Logger::ERROR

    schema_file = Rails.root.join('db/Schemafile')
    dsl = File.read(schema_file)
    delta = client.diff(dsl)


    if delta.differ?


      migrated, out = delta.migrate(
        noop: true
      )

      if migrated
        out.each_line do |line|
          puts line
        end
      end

      migrated
    end
  end
end
