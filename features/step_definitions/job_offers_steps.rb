When(/^I browse the default page$/) do
  visit '/'
end

Given(/^I am logged in as job offerer$/) do
  visit '/login'
  fill_in('user[email]', :with => 'offerer@test.com')
  fill_in('user[password]', :with => 'Passw0rd!')
  click_button('Login')
  page.should have_content('offerer@test.com')
end

Given(/^I access the new offer page$/) do
  visit '/job_offers/new'
  page.should have_content('Title')
end

When(/^I fill the title with "(.*?)"$/) do |offer_title|
  fill_in('job_offer[title]', :with => offer_title)
end

When(/^I fill the location with "(.*?)"$/) do |offer_location|
  fill_in('job_offer[location]', :with => offer_location)
end

When(/^confirm the new offer$/) do
  click_button('Create')
end

Then(/^I should see "(.*?)" in My Offers$/) do |content|
	visit '/job_offers/my'
  page.should have_content(content)
end

Then(/^I should not see "(.*?)" in My Offers$/) do |content|
  visit '/job_offers/my'
  page.should_not have_content(content)
end

Given(/^I have "(.*?)" offer in My Offers$/) do |offer_title|
  JobOffer.all.destroy
  visit '/job_offers/new'
  fill_in('job_offer[title]', :with => offer_title)
  fill_in('job_offer[location]', :with => "Villa Urquiza")
  fill_in('job_offer[due_date]', :with => "2018-10-10")
  click_button('Create')
end

Given(/^I edit it$/) do
  click_link('Edit')
end

And(/^I delete it$/) do
  click_button('Delete')
end

Given(/^I set title to "(.*?)"$/) do |new_title|
  fill_in('job_offer[title]', :with => new_title)
  fill_in('job_offer[location]', :with => "Villa Urquiza")
  fill_in('job_offer[due_date]', :with => "2018-10-10")
end

Given(/^I save the modification$/) do
  click_button('Save')
end

When(/^I fill the Due Date "(.*?)"$/) do |date|
  fill_in('job_offer[due_date]', :with => date)
end
