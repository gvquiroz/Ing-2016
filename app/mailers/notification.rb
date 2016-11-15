##
# Mailer methods can be defined using the simple format:
#
# email :registration_email do |name, user|
#   from 'admin@site.com'
#   to   user.email
#   subject 'Welcome to the site!'
#   locals  :name => name
#   content_type 'text/html'       # optional, defaults to plain/text
#   via     :sendmail              # optional, to smtp if defined, otherwise sendmail
#   render  'registration_email'
# end
#
# You can set the default delivery settings from your app through:
#
#   set :delivery_method, :smtp => {
#     :address         => 'smtp.yourserver.com',
#     :port            => '25',
#     :user_name       => 'user',
#     :password        => 'pass',
#     :authentication  => :plain, # :plain, :login, :cram_md5, no auth by default
#     :domain          => "localhost.localdomain" # the HELO domain provided by the client to the server
#   }
#
# or sendmail (default):
#
#   set :delivery_method, :sendmail
#
# or for tests:
#
#   set :delivery_method, :test
#
# or storing emails locally:
#
#   set :delivery_method, :file => {
#     :location => "#{Padrino.root}/tmp/emails",
#   }
#
# and then all delivered mail will use these settings unless otherwise specified.
#

JobVacancy::App.mailer :notification do

  email :contact_info_email do | job_application |
    from 'infojobvacancy2016@gmail.com'
    to job_application.applicant_email
    subject "Job Application: Contact information from offer: #{job_application.job_offer.title}"
    locals :job_offer => job_application.job_offer
    content_type :html
    render 'notification/contant_info_email'
  end

  email :candidate_info_email do | job_application |
    from 'infojobvacancy2016@gmail.com'
    to job_application.job_offer.owner.email
    subject "Job Application: Candidate information from offer: #{job_application.job_offer.title}"
    locals :job_offer => job_application.job_offer ,
            :applicant_email => job_application.applicant_email,
            :first_name => job_application.first_name,
            :last_name => job_application.last_name,
            :link_cv => job_application.link_cv,
            :short_bio => job_application.short_bio
    content_type :html
    render 'notification/candidate_info_email'
  end

# content_type is html because it don't have problems with simbols
  email :offer_reactivated_info_email do | job_reactivated |
    from 'infojobvacancy2016@gmail.com'
    to job_reactivated.job_offer.owner.email
    subject "#{job_reactivated.job_offer.title} was Reactivated"
    locals :job_offer => job_reactivated.job_offer
    content_type :html
    render 'notification/offer_reactivated_info_email'
  end
end
