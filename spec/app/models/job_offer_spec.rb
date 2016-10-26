require 'spec_helper'

describe JobOffer do

	describe 'model' do

		subject { @job_offer = JobOffer.new }

		it { should respond_to( :id) }
		it { should respond_to( :title ) }
		it { should respond_to( :location) }
		it { should respond_to( :description ) }
		it { should respond_to( :owner ) }
		it { should respond_to( :owner= ) }
		it { should respond_to( :created_on) }
		it { should respond_to( :updated_on ) }
		it { should respond_to( :due_date ) }
		it { should respond_to( :is_active) }

	end

	describe 'valid?' do

	  let(:job_offer) { JobOffer.new }

	  it 'should be false when title is blank' do
	  	puts job_offer.owner
	  	expect(job_offer.valid?).to eq false
	  end

	end

	describe 'deactive_old_offers' do

		let(:active_offer) do
			active_offer = JobOffer.new
			active_offer.due_date = 2017-12-12
			active_offer
		end

		let(:old_offer) do
			old_offer = JobOffer.new
			old_offer.due_date = 2016-10-10
			old_offer
		end
		
		it 'should deactivate old offers' do
			JobOffer.should_receive(:all).and_return([old_offer])
			JobOffer.deactivate_old_offers
			expect(old_offer.is_active).to eq false
		end


	end

end
