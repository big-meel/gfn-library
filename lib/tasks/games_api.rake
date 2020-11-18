
namespace :games do
  desc "Handle games from GFN api"
  task :create_files => [ :environment ]  do

    response = HTTParty.get(
      'https://static.nvidiagrid.net/supported-public-game-list/locales/gfnpc-en-US.json'
    ).to_s

    games = JSON.parse(response)

    games.each do |g|
      gfn = Game.new(id: g['id'])
      gfn.save
    end
    
    puts "All games created!"
  end


end