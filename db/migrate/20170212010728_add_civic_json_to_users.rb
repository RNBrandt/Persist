class AddCivicJsonToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :civic_json, :json
  end
end
