require_relative '../test_helper'

class UserCanSeeTableOfRobotsByStateTest < FeatureTest

  def test_user_can_see_table_of_robots_by_state_on_dashboard
    RobotManager.create(name: "Samus1", city: "Babylon", state: "Egypt", birth_date: "1987", date_hired: "2015", department: "Avengers")
    RobotManager.create(name: "Samus2", city: "Babylon", state: "Florida", birth_date: "1988", date_hired: "2014", department: "Avengers1")
    RobotManager.create(name: "Samus3", city: "Babylon", state: "Colorado", birth_date: "1989", date_hired: "2012", department: "Avengers2")
    RobotManager.create(name: "Samus4", city: "Babylon", state: "Washington", birth_date: "1987", date_hired: "2015", department: "Avengers")

    visit '/'

    within('#robot_state_table') do
      assert page.has_content?("Egypt")
      assert page.has_content?("Florida")
      assert page.has_content?("Colorado")
      assert page.has_content?("Washington")
    end
  end

end
