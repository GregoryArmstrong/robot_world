require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_assign_attributes_correctly
    robot = Robot.new({name: "Cornelius", city: "Orlando", state: "Florida",
                      birth_date: "1987", date_hired: "2015", department: "Badassery"})

    assert_equal "Cornelius", robot.name
    assert_equal "Orlando", robot.city
    assert_equal "Florida", robot.state
    assert_equal "1987", robot.birth_date
    assert_equal "2015", robot.date_hired
    assert_equal "Badassery", robot.department
  end

end
