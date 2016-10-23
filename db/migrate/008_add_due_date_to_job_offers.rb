migration 8, :add_due_date_to_job_offers do
  up do
  	modify_table :job_offers do
      add_column :due_date, Date
    end
  end

  down do
  	modify_table :job_offers do
      drop_column :due_date
    end
  end
end
