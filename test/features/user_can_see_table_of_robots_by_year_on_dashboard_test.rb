require_relative '../test_helper'

class UserCanSeeTableOfRobotsByYearTest < FeatureTest

  def test_user_can_see_table_of_robots_by_year_on_dashboard
    RobotManager.create(name: "Samus1", city: "Babylon", state: "Egypt", birth_date: "1987", date_hired: "2015", department: "Avengers")
    RobotManager.create(name: "Samus2", city: "Babylon", state: "Egypt", birth_date: "1988", date_hired: "2014", department: "Avengers")
    RobotManager.create(name: "Samus3", city: "Babylon", state: "Egypt", birth_date: "1989", date_hired: "2012", department: "Avengers")
    RobotManager.create(name: "Samus4", city: "Babylon", state: "Egypt", birth_date: "1987", date_hired: "2015", department: "Avengers")

    visit '/'

    within('#robot_year_table') do
      assert page.has_content?("2012")
      assert page.has_content?("2014")
      assert page.has_content?("2015")
    end
  end

end
