class AddGenreToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :genres, :text
  end
end
