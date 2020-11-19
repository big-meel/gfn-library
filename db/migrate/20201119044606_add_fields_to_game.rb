class AddFieldsToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :title, :string
    add_column :games, :sort_name, :string
    add_column :games, :is_fully_optimized, :boolean
    add_column :games, :steam_url, :string
    add_column :games, :publisher, :string
    add_column :games, :status, :string
  end
end
