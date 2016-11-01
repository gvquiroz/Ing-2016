Given(/^only a "(.*?)" offer exists in the offers list$/) do | job_title |
  @job_offer = JobOffer.new
  @job_offer.owner = User.first
  @job_offer.title = job_title
  @job_offer.location = 'a nice job'
  @job_offer.description = 'a nice job'
  @job_offer.save
end

Given(/^Today's date "(.*?)"$/) do | date_today |
  date = "2016-11-11"
  date = date_today
end

When(/^I activate$/) do
  click_button('Activate')
end


Then(/^I you should see the new day with an extra month in My Offers$/) do
  new_date = Date.today+30
  page.should have_content(new_date)
end

When(/^I apply$/) do
  pending
  #click_link('Apply')
  #fill_in('job_application[applicant_email]', :with => 'applicant@test.com')
end

Then(/^I should receive a mail with offerer info$/) do
  pending
  #mail_store = "#{Padrino.root}/tmp/emails"
  #file = File.open("#{mail_store}/applicant@test.com", "r")
  #content = file.read
  #content.include?(@job_offer.title).should be true
  #content.include?(@job_offer.location).should be true
  #content.include?(@job_offer.description).should be true
  #content.include?(@job_offer.owner.email).should be true
  #content.include?(@job_offer.owner.name).should be true
end

Given(/^a offer has is active in "(.*?)"$/) do | is_active |
  @job_offer = JobOffer.new
  @job_offer.owner = User.first
  @job_offer.title = 'a nice job'
  @job_offer.due_date = 2016-10-10
  @job_offer.is_active = is_active
  @job_offer.save
end

Given(/^a "(.*?)" offer has pass the due date$/) do | job_title |
  @job_offer = JobOffer.new
  @job_offer.owner = User.first
  @job_offer.title = job_title
  @job_offer.location = 'a nice job'
  @job_offer.description = 'a nice job'
  @job_offer.due_date = 2016-10-10
  @job_offer.is_active = false
  @job_offer.save
end

When(/^I access the offers list page$/) do
  visit '/job_offers'
end

Then(/^I should not see "(.*?)" in the offers list page$/) do |content|
  visit '/job_offers/job_offers'
  page.should_not have_content(content)
end

When(/^I access the my offer page$/) do
  visit '/job_offers/my'
end
