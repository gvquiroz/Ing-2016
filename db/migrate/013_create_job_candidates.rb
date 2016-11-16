migration 13, :create_job_candidates do
  up do
    create_table :job_candidates do
      column :id, Integer, :serial => true
      column :last_name, DataMapper::Property::String, :length => 255
      column :first_name, DataMapper::Property::String, :length => 255
      column :applicant_email, DataMapper::Property::String, :length => 255
      column :link_cv, DataMapper::Property::String, :length => 255
      column :short_bio, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :job_candidates
  end
end
