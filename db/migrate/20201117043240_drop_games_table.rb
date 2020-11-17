class DropGamesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :games
  end
end
