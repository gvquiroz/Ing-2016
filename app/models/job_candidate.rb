class JobCandidate
	include DataMapper::Resource

  # property <name>, <type>
	property :id, Serial
 	property :last_name, String
	property :first_name, String
	property :applicant_email, String
 	property :link_cv, String
  	property :short_bio, String
 	belongs_to :job_offer

	def offer
		job_offer
	end

 	def offer_applied=(a_job_offer)
    	self.job_offer = a_job_offer
 	end

 	def self.find_by_offer(offer)
		JobCandidate.all(:job_offer => offer)
	end
end
