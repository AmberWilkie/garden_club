Given(/^I am on the "([^"]*)" page$/) do |page|
  set_goto(page)
  visit @goto
  expect(current_path).to eq @goto
end

When(/^I visit the "([^"]*)" page$/) do |page|
  set_goto(page)
  visit @goto
  expect(current_path).to eq @goto
end

When(/^I try to visit the "([^"]*)" page$/) do |page|
# Use this test for when you are *trying* to visit a page, but expect to end up on another page
  set_goto(page)
  visit @goto
  expect(current_path).not_to eq @goto
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^I should not see "([^"]*)"$/) do |text|
  expect(page).not_to have_content(text)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |element, text|
  fill_in element, with: text
end

When(/^I click the "([^"]*)" button$/) do |button|
  click_button(button)
end

Then(/^I should be on the "([^"]*)" page$/) do |page|
  set_goto(page)
  expect(current_path).to eq @goto
end

When(/^I click the "([^"]*)" link$/) do |link|
  click_link(link)
end

Given(/^I am logged in$/) do
  visit new_user_session_path
  fill_in "Email", with: 'anna@random.com'
  fill_in "Password", with: 'MyPassword'
  click_button "Log in"
  expect(page).to have_content "Signed in successfully"
end

Given(/^I am not logged in$/) do
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test
    page.driver.submit :delete, "/users/sign_out", {}
  ensure
    Capybara.current_driver = current_driver
  end
end

When(/^I log out as "([^"]*)"$/) do |name|
  user = User.find_by(name: name)
  visit root_path
  expect(page).to have_content 'Logout'
  click_link('Logout')
  expect(page).to have_content "Signed out successfully"
end

def set_goto(page)
  @goto = root_path if page == "home"
  @goto = new_user_registration_path if page == "registration"
  @goto = edit_user_registration_path if page == "Edit Profile"
  @goto = profile_path if page == "Profile"
  @goto = private_path if page == "private information"
end
