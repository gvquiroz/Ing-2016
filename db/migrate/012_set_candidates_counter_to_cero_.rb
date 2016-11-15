migration 12, :set_candidates_counter_to_zero do
  up do
    offers = JobOffer.all
    offers.each do | offer |
      offer.candidates = 0
      offer.save
    end
  end

  down do
  end
end
