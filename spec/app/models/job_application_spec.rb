require 'spec_helper'

describe JobApplication do

	describe 'model' do

		subject { @job_offer = JobApplication.new }

		it { should respond_to( :applicant_email ) }
		it { should respond_to( :job_offer) }
		it { should respond_to( :link_cv) }

	end


	describe 'create_for' do

	  it 'should set applicant_email' do
	  	email = 'applicant@test.com'
	  	ja = JobApplication.create_for(email, JobOffer.new, 'cv')
	  	ja.applicant_email.should eq email
	  end

	  it 'should set job_offer' do
	  	offer = JobOffer.new
	  	ja = JobApplication.create_for('applicant@test.com', offer, 'cv')
	  	ja.job_offer.should eq offer
	  end

	  it 'should set cv_link' do
	  	cv = 'www.aboutme.com/cv'
	  	ja = JobApplication.create_for('applicant@test.com', JobOffer.new, cv)
	  	ja.link_cv.should eq cv
	  end
	end


	describe 'process' do

	  let(:job_application) { JobApplication.new }

	  it 'should deliver contact info notification' do
	  	ja = JobApplication.create_for('applicant@test.com', JobOffer.new,'link to cv')
	  	JobVacancy::App.should_receive(:deliver).with(:notification, :contact_info_email, ja)
	  	JobVacancy::App.should_receive(:deliver).with(:notification, :candidate_info_email, ja)
	  	ja.process
	  end

	end

	describe 'offer reactivated email' do

		it 'should deliver activate offer info notification' do
			activate_offer = JobApplication.create_for_activate(JobOffer.new)
			JobVacancy::App.should_receive(:deliver).with(:notification, :offer_reactivated_info_email, activate_offer)
			activate_offer.offer_reactivated_email
		end
	end

end
