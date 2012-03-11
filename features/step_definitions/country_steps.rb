def valid_user
  @user ||= { :login => "maintestuser", :email => "test@example.com", 
    :password => "password", :password_confirmation => "password" }
end

def sign_in user
  visit '/users/sign_in'
  fill_in "user_login", :with => user[:login]
  fill_in "user_password", :with => user[:password]
  click_button "Sign in"
end

def current_user
  @current_user ||= User.create! valid_user
end

Given /^I am signed in as an user$/ do
  current_user
  sign_in valid_user
end

Given /the following countries exist:/ do |countries|
  Country.create!(countries.hashes)
end

Given /the following currencies exists:/ do |currencies|
  Currency.create!(currencies.hashes)
end

Given /the following visited or collected data:/ do |data|
  current_user.user_countries.create(data.hashes)
end

Then /^I should see the following table:$/ do |expected_table|
  document = Nokogiri::HTML(page.body)
  rows = document.css('table tr').collect { |row| row.xpath('.//th|td').collect {|cell| cell.text } }
  expected_table.diff!(rows)
end

Then /^I should see updated following table:$/ do |expected_table|
  debugger
  false
end

Then /^I should see the following checked fields:/ do |ids|
  ids = ids.raw.flatten
  column = ids.shift.to_sym
  assert_equal current_user.user_countries.where(column => ids).size, ids.size
end