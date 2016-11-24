migration 9, :set_candidates_counter_to_zero do
  up do
    offers = JobOffer.all
    offers.each do | offer |
      offer.candidates = 0
      offer.save
    end
  end

  down do
  	modify_table :job_offers do
      drop_column :candidates
    end
  end
end
