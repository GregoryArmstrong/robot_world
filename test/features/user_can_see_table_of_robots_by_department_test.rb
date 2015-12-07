require_relative '../test_helper'

class UserCanSeeTableOfRobotsByDepartmentTest < FeatureTest

  def test_user_can_see_table_of_robots_by_department_on_dashboard
    RobotManager.create(name: "Samus1", city: "Babylon", state: "Egypt", birth_date: "1987", date_hired: "2015", department: "Avengers")
    RobotManager.create(name: "Samus2", city: "Babylon", state: "Egypt", birth_date: "1988", date_hired: "2014", department: "Avengers1")
    RobotManager.create(name: "Samus3", city: "Babylon", state: "Egypt", birth_date: "1989", date_hired: "2012", department: "Avengers2")
    RobotManager.create(name: "Samus4", city: "Babylon", state: "Egypt", birth_date: "1987", date_hired: "2015", department: "Avengers")

    visit '/'

    within('#robot_department_table') do
      assert page.has_content?("Avengers")
      assert page.has_content?("Avengers1")
      assert page.has_content?("Avengers2")
    end
  end

end
