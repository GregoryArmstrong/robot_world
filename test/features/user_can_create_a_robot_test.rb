require_relative '../test_helper'

class UserCanCreateARobotTest < FeatureTest

  def test_user_can_create_a_robot_with_valid_attributes
    visit '/robots/new'

    fill_in('robot[name]', :with => "Samus")
    fill_in('robot[city]', :with => "Babylon")
    fill_in('robot[state]', :with => "Egypt")
    fill_in('robot[birth_date]', :with => "1987")
    fill_in('robot[date_hired]', :with => "2015")
    fill_in('robot[department]', :with => "Avengers")
    within('.center-align') do
      click_button('submit')
    end

    assert_equal '/robots', current_path
    within('#robot_table') do
      assert page.has_content?("Samus")
    end
  end

end
