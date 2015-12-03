require 'yaml/store'

class RobotManager

  def self.database
    if ENV["RACK_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/robot_manager_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_manager_development.sqlite3")
    end
  end

  def self.create(robot)
    database.from(:robots).insert(name: robot[:name], city: robot[:city],
                                  state: robot[:state], avatar: robot["#{robot[:name] + robot[:department]}"],
                                  birth_date: robot[:birth_date], date_hired: robot[:date_hired],
                                  department: robot[:department])
  end

  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    raw_data = database.from(:robots).to_a
    raw_data.map { |data| Robot.new(data) }
  end

  def self.raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end

  def self.find(id)
    data = database.from(:robots).where(id: id).to_a.first
    Robot.new(data)
  end

  def self.update(id, data)
    target = database.from(:robots).update(data)
  end

  def self.delete(id)
    database.from(:robots).where(id: id).delete
  end

end
