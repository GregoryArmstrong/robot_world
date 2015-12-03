require 'sequel'
require 'sqlite3'

environments = ["test", "development"]

environments.each do |env|
  database = Sequel.sqlite("db/robot_manager_#{env}.sqlite3")
  database.create_table :robots do
    primary_key :id
    String :name, :size => 255
    String :city, :size => 255
    String :state, :size => 255
    String :avatar, :size => 255
    String :birth_date, :size => 255
    String :date_hired, :size => 255
    String :department, :size => 255
  end
  puts "Migrated #{env} environment."
end
