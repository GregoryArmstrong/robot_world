require_relative '../test_helper'

class UserCanSeeTableOfRobotsByCityTest < FeatureTest

  def test_user_can_see_table_of_robots_by_city_on_dashboard
    RobotManager.create(name: "Samus1", city: "Babylon", state: "Egypt", birth_date: "1987", date_hired: "2015", department: "Avengers")
    RobotManager.create(name: "Samus2", city: "Babylon1", state: "Egypt", birth_date: "1988", date_hired: "2014", department: "Avengers1")
    RobotManager.create(name: "Samus3", city: "Babylon2", state: "Egypt", birth_date: "1989", date_hired: "2012", department: "Avengers2")
    RobotManager.create(name: "Samus4", city: "Babylon", state: "Egypt", birth_date: "1987", date_hired: "2015", department: "Avengers")

    visit '/'

    within('#robot_city_table') do
      assert page.has_content?("Babylon")
      assert page.has_content?("Babylon1")
      assert page.has_content?("Babylon2")
    end
  end

end
