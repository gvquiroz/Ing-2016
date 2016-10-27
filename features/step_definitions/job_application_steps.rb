Given(/^only a "(.*?)" offer exists in the offers list$/) do | job_title |
  @job_offer = JobOffer.new
  @job_offer.owner = User.first
  @job_offer.title = job_title
  @job_offer.location = 'a nice job'
  @job_offer.description = 'a nice job'
  @job_offer.save
end

When(/^I apply$/) do
  click_link 'Apply'
  fill_in('job_application[applicant_email]', :with => 'applicant@test.com')
  #click_button('Apply')
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

Given(/^a "(.*?)" offer has pass the due date$/) do | job_title |
  @job_offer = JobOffer.new
  @job_offer.owner = User.first
  @job_offer.title = job_title
  @job_offer.location = 'a nice job'
  @job_offer.description = 'a nice job'
  @job_offer.due_date = 2016-12-12
  @job_offer.save
end

When(/^I access the offers list page$/) do
  visit '/job_offers'
end

Then(/^I should not see "(.*?)" in the offers list page$/) do |content|
  visit '/job_offers/job_offers'
  page.should_not have_content(content)
end