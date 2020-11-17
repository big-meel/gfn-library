class Game < ApplicationRecord

  def self.load_all_games
    response = HTTParty.get(
      'https://static.nvidiagrid.net/supported-public-game-list/locales/gfnpc-en-US.json'
    ).to_s

    games = JSON.parse(response)
  end

end

