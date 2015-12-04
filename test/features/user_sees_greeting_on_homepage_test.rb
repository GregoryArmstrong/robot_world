require_relative '../test_helper'

class UserSeesGreetingOnHomepageTest < FeatureTest

  def test_greeting_is_displayed
    RobotManager.create(name: "Samus", city: "Babylon", state: "Egypt", birth_date: "1987", date_hired: "2015", department: "Avengers")
    RobotManager.create(name: "Samus2", city: "Babylon", state: "Egypt", birth_date: "1987", date_hired: "2015", department: "Avengers")


    visit '/'

    within('#greeting') do
      assert page.has_content?("Welcome to Robo-Manager!")
    end
  end

end
