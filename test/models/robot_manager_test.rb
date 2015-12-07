require_relative '../test_helper'

class RobotManagerTest < Minitest::Test

  def create_robots(num)
    num.times do |n|
      RobotManager.create({name: "name#{n+1}", city: "city#{n+1}", state: "state#{n+1}", birth_date: "#{n+1}", date_hired: "#{n+1}", department: "department#{n+1}"})
    end
  end

  def test_robot_can_be_created
    create_robots(1)
    robot = RobotManager.all.last

    assert_equal "name1", robot.name
    assert_equal "city1", robot.city
    assert_equal "state1", robot.state
    assert_equal "1", robot.birth_date
    assert_equal "1", robot.date_hired
    assert_equal "department1", robot.department
  end

  def test_all_can_find_all_robots_correctly
    create_robots(3)
    robots = RobotManager.all

    robots.each_with_index do |robot, index|
      assert_equal "name#{index + 1}", robot.name
      assert_equal "city#{index + 1}", robot.city
      assert_equal "state#{index + 1}", robot.state
      assert_equal "#{index + 1}", robot.birth_date
      assert_equal "#{index + 1}", robot.date_hired
      assert_equal "department#{index + 1}", robot.department
    end
  end

  def test_can_find_a_specific_robot
    create_robots(2)
    found = RobotManager.all.last

    assert_equal "name2", found.name
    assert_equal "city2", found.city
    assert_equal "state2", found.state
    assert_equal "2", found.birth_date
    assert_equal "2", found.date_hired
    assert_equal "department2", found.department
  end

  def test_update_can_modify_an_existing_robot
    create_robots(1)
    awaiting_update = RobotManager.all.last
    RobotManager.update(awaiting_update.id, {name: "name5", city: "city5" })

    found = RobotManager.all.last

    assert_equal "name5", found.name
    assert_equal "city5", found.city
  end

  def test_can_delete_a_created_robot
    create_robots(3)
    total = RobotManager.all.count

    RobotManager.delete(RobotManager.all.first.id)

    assert_equal (total - 1), RobotManager.all.count
  end

  def test_can_average_ages_of_created_robots
    RobotManager.create({name: "robot1", city: "city1", state: "state1", birth_date: "1987", date_hired: "03122015", department: "department1"})
    RobotManager.create({name: "robot2", city: "city2", state: "state2", birth_date: "1985", date_hired: "03122015", department: "department2"})
    RobotManager.create({name: "robot3", city: "city3", state: "state3", birth_date: "1990", date_hired: "03122015", department: "department3"})

    assert_equal 27, RobotManager.average_age
  end

end
