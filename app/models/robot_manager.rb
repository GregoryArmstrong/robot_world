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
                                  state: robot[:state], avatar: "#{robot[:name]} + #{robot[:department]}",
                                  birth_date: robot[:birth_date], date_hired: robot[:date_hired],
                                  department: robot[:department])
  end

  def self.robots_table
    database.from(:robots)
  end

  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    raw_data = robots_table.to_a
    raw_data.map { |data| Robot.new(data) }
  end

  def self.find(id)
    data = robots_table.where(id: id).to_a.first
    Robot.new(data)
  end

  def self.update(id, data)
    target = robots_table.where(id: id).update(data)
  end

  def self.delete(id)
    robots_table.where(id: id).delete
  end

  def self.average_age
    ages = robots_table.map do |robot|
      robot[:date_hired][-4..-1].to_i - robot[:birth_date].to_i
    end
    ages.reduce(:+) / database.from(:robots).to_a.size
  end

end
