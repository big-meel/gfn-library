
namespace :games do
  desc "Create games from GFN api"
  task :create_files => [ :environment ]  do

    response = HTTParty.get(
      'https://static.nvidiagrid.net/supported-public-game-list/locales/gfnpc-en-US.json'
    ).to_s

    games = JSON.parse(response)

    games.each do |g|
      unless (Game.find(g['id']) rescue false)
        gfn = Game.new(
          id: g['id'],
          title: g['title'],
          sort_name: g['sortName'],
          is_fully_optimized: g['isFullyOptimized'],
          steam_url: g['steamUrl'],
          store: g['store'],
          publisher: g['publisher'],
          status: g['status'],
          genres: g['genres']
        )
        gfn.save
      end
    end
    
    puts "Done!"
  end


  desc "Update Existing files"
  task :update_files => [ :environment ] do
    response = HTTParty.get(
      'https://static.nvidiagrid.net/supported-public-game-list/locales/gfnpc-en-US.json'
    ).to_s

    games = JSON.parse(response)

    games.each do |g|
       Game.find(g['id']).update(
        id: g['id'],
        title: g['title'],
        sort_name: g['sortName'],
        is_fully_optimized: g['isFullyOptimized'],
        steam_url: g['steamUrl'],
        store: g['store'],
        publisher: g['publisher'],
        status: g['status'],
        genres: g['genres']
      ) rescue nil
    end

    puts 'Updated!'
  end


  desc "Update Images"
  task :update_images => [ :environment ] do
    games = Game.all.select { |game| game.image_url.nil? }
    games.each_with_index do |g, i|
      response = Game.scrape_images(g.title)

      g.update(image_url: "https://images.igdb.com/igdb/image/upload/t_cover_big/#{response["image_id"]}.jpg") unless response.nil?

      puts "#{(i/games.count.to_f) * 100} Complete..."
    end

    puts "Done!"
  end

end