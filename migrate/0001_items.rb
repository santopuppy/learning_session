Sequel.migration do
  change do
    create_table(:items) do
      primary_key :id
      String :content, null: false
    end
  end
end
