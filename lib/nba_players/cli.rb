module NbaPlayers
  class CLI
      URL = "https://www.washingtonpost.com/graphics/2017/sports/nba-top-100-players-2017/?noredirect=on&utm_term=.adcc13ae7e38"
      COLORIER = ->(player){
        color = ""
        color = :green if player.trend == "up"
        color = :red if player.trend == "down"
        color
      }

    def self.run
      collections = NbaPlayers::Scraper.scrape_page(URL)
      NbaPlayers::Players.create_players_from_collection collections
    end

    def self.start
      run
      system "cls" or system "clear"
      puts "----------------------WELCOME TO NBA PLAYERS-------------------------\n".cyan
      puts
      puts "--**Player's trend ("+"upswing".colorize(:green)+", constant, "+"decline".colorize(:red)+ ") .**--\n"
      puts
      input = ""
      until input == "n" or input == "no"
        opt = -1
        until opt > 0 and opt <= 10
          puts "Invalid input!!! \n" if opt == 0 or opt >= 10
          rows = [
            ["1. List all players by ranking","2. List all players by Age"],
            ["3. List all players by points","4. List all players by rebounds"],
            ["5. List all players by assists","6. List all players by 3pt"],
            ["7. List all players by blocks","8. List all players by free throw"],
            ["9. Group by trend","10. Exit"],
          ]
          puts Terminal::Table.new :title => "Menu", :rows => rows, :style => {:all_separators => true}
          print "=> "
          opt = gets.strip.to_i

          system "cls" or system "clear"
        end
        
        break if opt == 10
 
        if opt != 9
          order =  NbaPlayers::Players.sort opt

          until input == "n" or input == "no"
            puts "\n What number of players do you want to see? 1-20, 21-40, 41-60, 61-80 or 81-100?  "
            print "=> "
            n_pal = gets.strip.to_i
            n_pal = 1 if n_pal == 0
            n_pal = 80 if n_pal > 100

            #print_players index
            print_players n_pal, order  if order.class == String
            print_players n_pal, *order  if order.class == Array

            puts "What player do you want to see more information on?"
            print "=> "
            input = gets.strip.to_i
            input = 100 if input > 100

            #print_player index
            player = NbaPlayers::Players.find input
            print_player player

            puts "Do you want to see information about another player? (y/n)"
            print "=> "
            input = gets.strip.downcase
          end
        else
          until input == "n" or input == "no"
            puts "\n What group of trends do you want to see?"," (1- constant, 2-"+" upswing".colorize(:green)+", 3-"+" decline".colorize(:red)+")"
            print "=> "
            n_trend = gets.strip.to_i
            n_trend = 1 if n_trend  == 0
            n_trend = 3 if n_trend > 3

            choices = ["neutral", "up", "down"]
            by_input = choices[n_trend-1]

            #print_players group by_input
            print_players_group by_input

            puts "What player do you want to see more information on?"
            print "=> "
            input = gets.strip.to_i
            sizeg = NbaPlayers::Players.group_size by_input
            input = sizeg if input > sizeg

            #print_player index
            player = NbaPlayers::Players.find_group input, by_input
            print_player player

            puts "Do you want to see information about another player? (y/n)"
            print "=> "
            input = gets.strip.downcase
          end
        end

        puts "Do you want to list all players? (y/n)"
        print "=> "
        input = gets.strip.downcase
      end

      puts "Goodbye !!"
      puts "See you soon 👋!!!".blue

    end

    def self.print_players(from_number, order = "rank", stats = "")
      
      if stats == ""
        rows = NbaPlayers::Players.all[from_number-1, 20].each.with_index(from_number).map do |player, index|
          [index, player.name.colorize(COLORIER.(player)), "#{order}:#{player.send(order)}"]
        end
      else
        rows = NbaPlayers::Players.all[from_number-1, 20].each.with_index(from_number).map do |player, index|
          [index, player.name.colorize(COLORIER.(player)), "#{stats} : #{player.send(order)[stats.to_sym]}"]
        end
      end

      puts Terminal::Table.new :title => "Players #{from_number} - #{from_number+19}", :rows => rows, :style => {:all_separators => true}
    end

    def self.print_player player
      table = Terminal::Table.new :title => "#{player.name}", :rows => [
        ["Age", player.statistics[:AGE].colorize(COLORIER.(player))],
        ["Position", player.position.colorize(COLORIER.(player))],
        ["Team", player.team.colorize(COLORIER.(player))],
        ["Rank", player.rank.to_s.colorize(COLORIER.(player))],
        ["PPG", player.statistics[:PPG].to_s.colorize(COLORIER.(player))],
        ["RPG", player.statistics[:RPG].to_s.colorize(COLORIER.(player))],
        ["APG", player.statistics[:APG].to_s.colorize(COLORIER.(player))],
        ["BLK", player.statistics[:BLK].to_s.colorize(COLORIER.(player))],
        ["FT", player.statistics[:FT].to_s.colorize(COLORIER.(player))],
        ["Steal", player.statistics[:STL].to_s.colorize(COLORIER.(player))],
        ["FG", player.statistics[:FG].to_s.colorize(COLORIER.(player))],
        ["3PT", player.statistics[:THREEPT].to_s.colorize(COLORIER.(player))]
        #["Info", player.info.colorize(COLORIER.(player))]
      ]
      puts table
    end

    def self.print_players_group by_input
      arr, rows = [], []
      NbaPlayers::Players.group(by_input).each.with_index(1) do |player, i|

        arr.push i, player.name.colorize(COLORIER.(player)), " "
        if arr.size == 6
          rows << arr
          arr = []
        end

      end
      rows << arr
      title = {up: "UPSWING".colorize(:green), down: "DECLINE".colorize(:red), neutral: "CONSTANT"}
      puts Terminal::Table.new :title => title[by_input.to_sym], :rows => rows, :style =>{:all_separators => true}
    end

  end
end