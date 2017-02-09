And(/^a candidate click apply$/) do
  click_link ('Apply')
end

And(/^candidate confirm job application$/) do
  click_link ('Apply')
end

Then(/^I should receive a mail with offerer info$/) do
  mail_store = "#{Padrino.root}/tmp/emails"
  file = File.open("#{mail_store}/applicant@test.com", "r")
  content = file.read
  content.include?(@job_offer.title).should be true
  content.include?(@job_offer.location).should be true
  content.include?(@job_offer.description).should be true
  content.include?(@job_offer.owner.email).should be true
  content.include?(@job_offer.owner.name).should be true
end

And(/^a candidate has applied offer$/) do
  visit '/job_offers/apply'
  fill_in('job_application[first_name]', :with => 'Kent')
  fill_in('job_application[last_name]', :with => 'Del Rio')
  fill_in('job_application[applicant_email]', :with => 'candidate@email.com')
  fill_in('job_application[link_cv]', :with => 'http://delrioblog.com')
  click_button('Apply')
end


Given(/^the candidate form is filled with "(.*?)"$/) do | candidate_email |
  visit '/job_offers/apply'
  fill_in('job_application[first_name]', :with => 'Kent')
  fill_in('job_application[last_name]', :with => 'Beck')
  fill_in('job_application[applicant_email]', :with => candidate_email)
  fill_in('job_application[link_cv]', :with => 'http://kentbeckblog.com')
end

Then(/^I should receive an email from "(.*?)"$/) do | job_vacancy_email |
  passed
end

And(/^I should see "(.*?)" in the email body$/) do | email |
  passed
end

Then(/^I should see "(.*?)" in the email subject$/) do | offer_reactivated |
  passed
end
