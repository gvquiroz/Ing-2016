migration 11, :add_job_offer_id_to_job_candidates do
  up do
    modify_table :job_candidates do
      add_column :job_offer_id, Integer
    end
  end

  down do
    modify_table :job_candidates do
      drop_column :job_offer_id
    end
  end
end
