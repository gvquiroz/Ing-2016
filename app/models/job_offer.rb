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
	validates_presence_of :location
	validates_presence_of :due_date

	def owner
		user
	end

	def owner=(a_user)
		self.user = a_user
	end

	def self.all_active
		JobOffer.deactivate_old_offers
		JobOffer.all(:is_active => true)
	end

	def self.find_by_owner(user)
		JobOffer.deactivate_old_offers
		JobOffer.all(:user => user)
	end

	def self.deactivate_old_offers
		due_offers = JobOffer.all(:due_date.lt => Date.today)

		due_offers.each do | offer |
			offer.deactivate
			offer.save
		end
	end

	def activate
		self.is_active = true
		self.due_date = Date.today+30
	end

	def deactivate
		self.is_active = false
	end

	def validate?(date)
		if(date.match(/\d{4}-\d{2}-\d{2}/) && Date.strptime(date, '%Y-%m-%d'))
			return true
		else
			return false
		end
	end
end
