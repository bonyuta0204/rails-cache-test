connection_setting = Rails.configuration.database_configuration['test']
client = Ridgepole::Client.new(connection_setting)

schema_file = Rails.root.join('db/Schemafile')

dsl = File.read(schema_file)
delta = client.diff(dsl)
differ = delta.differ?

differ, _out = delta.migrate if differ
