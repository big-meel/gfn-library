class AddStoreToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :store, :string
  end
end
