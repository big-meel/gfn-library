
namespace :games do
  desc "Handle games from GFN api"
  task :create_files => [ :environment ]  do

    response = HTTParty.get(
      'https://static.nvidiagrid.net/supported-public-game-list/locales/gfnpc-en-US.json'
    ).to_s

    games = JSON.parse(response)

    games.each do |g|
      gfn = Game.new(
        id: g['id'],
        title: g['title'],
        sort_name: g['sortName'],
        is_fully_optimized: g['isFullyOptimized'],
        steam_url: g['steamUrl'],
        store: g['store'],
        publisher: g['publisher'],
        status: g['status']
      )
      gfn.save
    end
    
    puts "All games created!"
  end


end