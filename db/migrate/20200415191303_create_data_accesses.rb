class CreateDataAccesses < ActiveRecord::Migration[6.0]
  def change
    create_table :data_accesses do |t|

      t.string :api_token
      t.timestamps
    end
  end
end
