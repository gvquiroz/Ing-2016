JobVacancy::App.controllers :job_offers do

  get :my do
    @offers = JobOffer.find_by_owner(current_user)
    render 'job_offers/my_offers'
  end

  get :index do
    @offers = JobOffer.all_active
    render 'job_offers/list'
  end

  get :new do
    @job_offer = JobOffer.new
    render 'job_offers/new'
  end

  get :latest do
    @offers = JobOffer.all_active
    render 'job_offers/list'
  end

  get :edit, :with =>:offer_id  do
    @job_offer = JobOffer.get(params[:offer_id])
    # ToDo: validate the current user is the owner of the offer
    render 'job_offers/edit'
  end

  get :candidates, :with =>:offer_id  do
    @job_offer = JobOffer.get(params[:offer_id])
    @candidates = JobCandidate.find_by_offer(@job_offer)
    render 'job_offers/candidates_list'
  end

  get :delete_confirmation, :with =>:offer_id  do
    @job_offer = JobOffer.get(params[:offer_id])
    render 'job_offers/delete_confirmation'
  end

  get :apply, :with =>:offer_id  do
    @job_offer = JobOffer.get(params[:offer_id])
    @job_application = JobApplication.new
    @job_offer.add_one_apply
    # ToDo: validate the current user is the owner of the offer
    render 'job_offers/apply'
  end

  post :search do
    @offers = JobOffer.search_by_title(params[:q])
    render 'job_offers/list'
  end

  delete :delete_confirmation, :with => :offer_id do
    @job_offer = JobOffer.get(params[:offer_id])
    @job_offer.destroy
    flash[:success] = 'Offer deleted'
    redirect 'job_offers/my'

  end

  post :apply, :with => :offer_id do
    @job_offer = JobOffer.get(params[:offer_id])
    @job_application = JobApplication.new

    applicant_email = params[:job_application][:applicant_email]
    first_name = params[:job_application][:first_name]
    last_name = params[:job_application][:last_name]
    link = params[:job_application][:link_cv]
    short_bio = params[:job_application][:short_bio]

    if (first_name.blank? || last_name.blank? || applicant_email.blank?) || (link.blank? && short_bio.blank?)
      flash.now[:error] = 'Please complete the required fields'
      render 'job_offers/apply'
    else
      @candidates = JobCandidate.new(params[:job_application])
      @candidates.offer_applied = @job_offer
      @job_application = JobApplication.create_for(applicant_email, @job_offer, first_name, last_name, link, short_bio)
      @job_application.process
      @candidates.save
      @job_offer.add_one_candidate
      flash[:success] = 'Contact information sent.'
      redirect '/job_offers'
    end
  end

#This code might be better
  post :create do
    @job_offer = JobOffer.new(params[:job_offer])
    @job_offer.owner = current_user
    if @job_offer.save
      if params['create_and_twit']
        TwitterClient.publish(@job_offer)
      end
      flash[:success] = 'Offer created'
      redirect '/job_offers/my'
    elsif params[:job_offer][:title].length == 0
      flash.now[:error] = 'Title is mandatory'
      render 'job_offers/new'
    elsif params[:job_offer][:location].length == 0
      flash.now[:error] = 'Location is mandatory'
      render 'job_offers/new'
    elsif params[:job_offer][:due_date].length == 0
      flash.now[:error] = 'Date is mandatory'
      render 'job_offers/new'
    end
  end

  post :update, :with => :offer_id do
    @job_offer = JobOffer.get(params[:offer_id])
    @job_offer.update(params[:job_offer])
    JobOffer.activate_if_needed
    if @job_offer.save
      flash[:success] = 'Offer updated'
      redirect '/job_offers/my'
    elsif params[:job_offer][:title].length == 0
      flash.now[:error] = 'Title is mandatory'
      render 'job_offers/edit'
    elsif params[:job_offer][:location].length == 0
      flash.now[:error] = 'Location is mandatory'
      render 'job_offers/edit'
    elsif params[:job_offer][:due_date].length == 0
      flash.now[:error] = 'Date is mandatory'
      render 'job_offers/edit'
    end
  end

  put :activate, :with => :offer_id do
    @job_offer = JobOffer.get(params[:offer_id])
    @job_offer.activate
    if @job_offer.save
      @job_reactivated = JobApplication.create_for_activate(@job_offer)
      @job_reactivated.offer_reactivated_email
      flash[:success] = 'Offer reactivated for 30 days'
      redirect '/job_offers/my'
    else
      flash.now[:error] = 'Operation failed'
      redirect '/job_offers/my'
    end
  end

  delete :destroy do
    @job_offer = JobOffer.get(params[:offer_id])
    if @job_offer.destroy
      flash[:success] = 'Offer deleted'
    else
      flash.now[:error] = 'Title is mandatory'
    end
    redirect 'job_offers/my'
  end

end
