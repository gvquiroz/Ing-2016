JobVacancy::App.controllers :health do
  
  get :index do
    ping = Ping.create(:description => 'health-controller')
    ping.nil?? 500 : 'ok'
  end

  get :stats do
    content_type:'json'
    { offers_count: JobOffer.count, users_count: User.count }.to_json
  end

  get :version do
  	Version.current
  end

  get :reset do
    JobOffer.destroy
    Ping.destroy
    User.destroy
    user = User.create(:email => 'offerer@test.com',
                   :name => 'Offerer', 
                   :password => "Passw0rd!")
    JobOffer.create(:title => 'Java programmer',
                    :user => user,
                    :description => 'Spring experience required',
                    :location => 'Cordoba')
    JobOffer.create(:title => 'Web programmer',
                    :user => user,
                    :description => 'HTML5 experience required',
                    :location => 'Rosario')
    'ok'
  end

end