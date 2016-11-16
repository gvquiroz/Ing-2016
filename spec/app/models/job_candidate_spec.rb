require 'spec_helper'

describe JobCandidate do

	describe 'model' do

		subject { @candidates = JobCandidate.new }

    it { should respond_to( :last_name) }
    it { should respond_to( :first_name) }
    it { should respond_to( :applicant_email ) }
    it { should respond_to( :link_cv) }
		it { should respond_to( :short_bio) }
    it { should respond_to( :job_offer) }

  end
end
