class JobOffer
	include DataMapper::Resource

	# property <name>, <type>
	property :id, Serial
	property :title, String
	property :location, String
	property :description, String
  property :created_on, Date
  property :updated_on, Date
	property :due_date, Date
  property :is_active, Boolean, :default => true
	belongs_to :user

	validates_presence_of :title

	def owner
		user
	end

	def owner=(a_user)
		self.user = a_user
	end

	def self.all_active
		JobOffer.all(:is_active => true)
	end

	def self.all_valid
		JobOffer.all(:due_date.gt => Date.today)
	end

	def self.find_by_owner(user)
		JobOffer.all(:user => user)
	end

	def self.deactivate_old_offers
		active_offers = JobOffer.all(:is_active => true)

		active_offers.each do | offer |
			if (Date.today - offer.updated_on) >= 30
				offer.deactivate
				offer.save
			end
		end
	end

	def activate
		self.is_active = true
	end

	def deactivate
		self.is_active = false
	end

end
