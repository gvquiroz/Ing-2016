When(/^candidate applies an offer$/) do
  click_link 'Apply'
  fill_in('job_application[applicant_email]', :with => 'applicant@test.com')
  click_button('Apply')
end

Then(/^I should receive a mail with offerer info$/) do
  pending
  mail_store = "#{Padrino.root}/tmp/emails"
  file = File.open("#{mail_store}/applicant@test.com", "r")
  content = file.read
  content.include?(@job_offer.title).should be true
  content.include?(@job_offer.location).should be true
  content.include?(@job_offer.description).should be true
  content.include?(@job_offer.owner.email).should be true
  content.include?(@job_offer.owner.name).should be true
end

Given(/^the candidate form is filled with "(.*?)"$/) do | candidate_email |
  pending
  visit '/job_offers/apply'
  @job_application = JobApplication.new
  @job_application.create_for(candidate_email, @job_offer, 'Kent','Beck','https://kentbeckblog.com','Programmer')

end

Then(/^I should receive an email from "(.*?)"$/) do | job_vacancy_email |
  pending
end

And(/^I should see "(.*?)" in the email body$/) do | email |
  pending
end

Then(/^I should see "(.*?)" in the email subject$/) do | offer_reactivated |
  pending
end
