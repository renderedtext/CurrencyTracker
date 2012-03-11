Given /^I am not authenticated$/ do
  visit('/users/sign_up')
end

Then /^I should be signed in$/ do
  page.has_content? "Logout"
end

Given /^I am a new, authenticated user$/ do
  visit '/users/sign_in'
end