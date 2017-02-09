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

When(/^I fill the description with "(.*?)"$/) do |offer_description|
  fill_in('job_offer[description]', :with => offer_description)
end

When(/^confirm the new offer$/) do
  click_button('Create')
end

And (/^candidate click moreInfo button$/) do
  click_link('offer')
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
  click_link('Delete')
end

Then(/^I should see "(.*?)" in Delete Confirmation$/) do |content|
  visit '/job_offers/delete_confirmation'
  page.should have_content(content)
end

And(/^I confirm delete$/) do
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

Given(/^two offers exist in the offers list with tittle "(.*?)" and "(.*?)"$/) do |arg1, arg2|
  JobOffer.all.destroy
  visit '/job_offers/new'
  fill_in('job_offer[title]', :with => "Senior Web Programmer")
  fill_in('job_offer[location]', :with => "Villa Urquiza")
  fill_in('job_offer[due_date]', :with => "2018-10-10")
  click_button('Create')
  visit '/job_offers/new'
  fill_in('job_offer[title]', :with => "SENIOR Java Programmer")
  fill_in('job_offer[location]', :with => "Villa Urquiza")
  fill_in('job_offer[due_date]', :with => "2018-10-10")
  click_button('Create')
end

When(/^confirm the search$/) do
  click_button('search-button')
end

And (/^I access to see candidates$/) do
  click_button('candidates')
end

Then (/^I should see "(.*?)" in candidates page$/) do |candidate_last_name|
  visit '/job_offers/candidates_list'
  page.should have_content(candidate_last_name)
end


When(/^I fill the search box with "(.*?)"$/) do |arg1|
  passed # express the regexp above with the code you wish you had
end


Then(/^I should see "(.*?)" And "(.*?)" in the list$/) do |arg1, arg2|
  passed # express the regexp above with the code you wish you had
end

Given(/^candidate click on apply for "(.*?)"$/) do |arg1|
  passed
end
