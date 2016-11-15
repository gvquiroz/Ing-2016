migration 9, :add_counter_to_job_offers do
  up do
  	modify_table :job_offers do
      add_column :applies, Integer
    end
  end

  down do
  	modify_table :job_offers do
      drop_column :applies
    end
  end
end
