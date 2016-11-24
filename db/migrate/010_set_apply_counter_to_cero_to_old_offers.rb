migration 10, :set_apply_counter_to_cero_to_old_offers do
  up do
    offers = JobOffer.all
    offers.each do | offer |
      offer.applies = 0
      offer.save
    end
  end

  down do
  end
end
