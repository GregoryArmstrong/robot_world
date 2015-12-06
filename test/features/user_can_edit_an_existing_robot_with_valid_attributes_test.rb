require_relative '../test_helper'

class UserCanEditAnExistingRobotTest < FeatureTest

  def test_user_can_edit_a_robot_with_valid_attributes
    skip
    RobotManager.create(name: "Samus", city: "Babylon", state: "Egypt", birth_date: "1987", date_hired: "2015", department: "Avengers")
    selected = RobotManager.all.last
    visit '/robots'

    click_link('edit_button')

    assert_equal "/robots/#{selected.id}/edit", current_path

    fill_in('robot[name]', :with => "Cornelius")
    click_button('submit_button')

    assert_equal '/robots', current_path
    within('#robot_table') do
      assert page.has_content?("Cornelius")
    end
  end

end
