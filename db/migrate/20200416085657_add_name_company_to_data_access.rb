class AddNameCompanyToDataAccess < ActiveRecord::Migration[6.0]
  def change
    add_column(:data_accesses, :company_name, :string)
  end
end
