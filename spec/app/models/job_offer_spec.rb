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
		it { should respond_to( :applies ) }
		it { should respond_to( :is_active) }

	end

	describe 'valid?' do

	  let(:job_offer) { JobOffer.new }

	  it 'should be false when title is blank' do
	  	puts job_offer.owner
	  	expect(job_offer.valid?).to eq false
	  end

		it 'should be false when location is blank' do
			job_offer.title = "Ruby Jr"
			puts job_offer.owner
	  	expect(job_offer.valid?).to eq false
	  end

		it 'should be false when due_date is blank' do
			job_offer.title = "Ruby Jr"
			job_offer.location = "Palermo"
			puts job_offer.owner
	  	expect(job_offer.valid?).to eq false
	  end

	end

	describe 'deactive_old_offers' do

		let(:active_offer) do
			active_offer = JobOffer.new
			active_offer.due_date = "2020-12-12"
			active_offer
		end

		let(:old_offer) do
			old_offer = JobOffer.new
			old_offer.due_date = "2016-10-10"
			old_offer
		end

		it 'should deactivate old offers' do
			JobOffer.should_receive(:all).and_return([old_offer])
			JobOffer.deactivate_old_offers
			expect(old_offer.is_active).to eq false
		end

		it 'should not deactivate valid offer' do
			JobOffer.should_receive(:all).and_return([active_offer])
			JobOffer.deactivate_old_offers
			expect(old_offer.is_active).to eq true
		end
	end

	describe 'applies_counter' do
		let(:job_offer) { JobOffer.new }

		it 'should have 0 applies when its new' do
			expect(job_offer.applies).to eq 0
		end

		it 'should have 1 applies when someone applies' do
			job_offer.add_one_apply
			expect(job_offer.applies).to eq 1
		end

		it 'should have 3 applies when someone applies three times' do
			job_offer.add_one_apply
			job_offer.add_one_apply
			job_offer.add_one_apply
			expect(job_offer.applies).to eq 3
		end
	end

end
