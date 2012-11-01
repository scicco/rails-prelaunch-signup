Given /^I am logged in as an administrator$/ do
  @admin = FactoryGirl.create(:admin_user, email: "admin@example.com")
  @admin_visitor ||= { :email => "admin@example.com",
    :password => "please", :password_confirmation => "please" }
  admin_sign_in
end

When /^I visit the users page$/ do
  visit admin_users_path
end

When /^I click a link "([^"]*)"$/ do |arg1|
  click_on (arg1)
end

Then /^I should see a list of users$/ do
  page.should have_content @user[:email]
end

Then /^I should see an access denied message$/ do
  page.should have_content "You need to sign in or sign up before continuing."
end

Then /^show me the page$/ do
  save_and_open_page
end

def admin_sign_in
  visit '/admin/'
  fill_in "admin_user_email", :with => @admin_visitor[:email]
  fill_in "admin_user_password", :with => @admin_visitor[:password]
  click_button "Login"
end
