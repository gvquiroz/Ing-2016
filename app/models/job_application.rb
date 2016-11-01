class JobApplication

	attr_accessor :applicant_email
	attr_accessor :job_offer
	attr_accessor :link_cv

	def self.create_for(email, offer, cv)
		app = JobApplication.new
		app.applicant_email = email
		app.job_offer = offer
		app.link_cv = cv
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
