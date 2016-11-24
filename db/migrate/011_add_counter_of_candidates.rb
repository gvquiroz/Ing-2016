migration 11, :add_counter_of_candidates do
  up do
  	modify_table :job_offers do
      add_column :candidates, Integer
    end
  end

  down do
  	modify_table :job_offers do
      drop_column :candidates
    end
  end
end
