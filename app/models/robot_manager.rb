require 'yaml/store'
require_relative 'robot'

class RobotManager

  def self.database
    @database ||= YAML::Store.new("db/robot_manager")
  end

  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << {"id" => database['total'], "name" => robot[:name], "city" => robot[:city], "state" => robot[:state], "avatar" => robot[:avatar], "birth_date" => robot[:birth_date], "date_hired" => robot[:date_hired], "department" => robot[:department] }
    end
  end

end
