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
	property :applies, Integer, :default => 0
	property :candidates, Integer, :default => 0
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

	def self.search_by_title (search_tittle)
		active_offers = JobOffer.all_active
		offers = Array.new
		active_offers.each do |	offer |
			if offer.title.downcase.include? search_tittle.downcase
			offers.push(offer)
			end
		end
		offers
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

	def self.activate_if_needed
		due_offers = JobOffer.all(:due_date.gt => Date.today)
		due_offers.each do | offer |
			offer.is_active = true
			offer.save
		end
	end

	def add_one_apply
		self.applies += 1
		self.save
	end

	def add_one_candidate
		self.candidates += 1
		self.save
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
