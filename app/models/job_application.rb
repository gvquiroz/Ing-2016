class JobApplication

	attr_accessor :applicant_email
	attr_accessor :job_offer
	attr_accessor :first_name
	attr_accessor :last_name
	attr_accessor :link_cv
	attr_accessor :short_bio

	def self.create_for(email, offer, firstname, lastname, cv, shortbio)
		app = JobApplication.new
		app.applicant_email = email
		app.job_offer = offer
		app.first_name = firstname
		app.last_name = lastname
		app.link_cv = cv
		app.short_bio = shortbio
		app
	end

	def self.create_for_activate(offer)
		app_activate = JobApplication.new
		app_activate.job_offer = offer
		app_activate
	end

	def process
    JobVacancy::App.deliver(:notification, :contact_info_email, self)
    JobVacancy::App.deliver(:notification, :candidate_info_email, self)
  end

	def offer_reactivated_email
		JobVacancy::App.deliver(:notification, :offer_reactivated_info_email, self)
  end

end
