require 'sequel/core'

DB = Sequel.postgres(
  ENV.delete('POSTGRES_DB'),
  user: ENV.delete('POSTGRES_USER'),
  password: ENV.delete('POSTGRES_PASSWORD'),
  host: ENV.delete('POSTGRES_HOST')
)
# DB = Sequel.connect(ENV.delete('APP_DATABASE_URL') || ENV.delete('DATABASE_URL'))
