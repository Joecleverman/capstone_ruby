module NbaPlayers
  class Players
    attr_accessor :trend, :name, :team, :position, :statistics, :rank, :info
    @@all = []

    def self.all
      @@all
    end

    def initialize(infos_hash)
      infos_hash.each do |info, value|
        send("#{info}=", value)
      end
      @@all << self
    end

    def self.create_players_from_collection(collection)
      collection.each do |players|
        players.each { |infos_hash| new(infos_hash) }
      end
    end

    def self.find(input)
      all[input - 1]
    end

    def self.sort(input = 1)
      choices = %w[rank AGE PPG RPG APG THREEPT BLK FT]
      by_input = choices[input - 1]
      if input > 1
        return sort_asc by_input, true if by_input == 'AGE'

        sort_desc by_input
      else
        sort_asc by_input
      end
    end

    def self.sort_asc(by_input, stats = false)
      if !stats
        all.sort! do |player1, player2|
          player1.send(by_input) <=> player2.send(by_input)
        end
        by_input
      else
        all.sort! do |player1, player2|
          player1.send('statistics')[by_input.to_sym] <=> player2.send('statistics')[by_input.to_sym]
        end
        ['statistics', by_input]
      end
    end

    def self.sort_desc(by_input, _stats = false)
      all.sort! do |player1, player2|
        player2.send('statistics')[by_input.to_sym] <=> player1.send('statistics')[by_input.to_sym]
      end
      ['statistics', by_input]
    end

    def self.group(by_input)
      all.select do |player|
        player.trend == by_input
      end
    end

    def self.find_group(index, by_input)
      group(by_input)[index - 1]
    end

    def self.group_size(by_input)
      group(by_input).size
    end
  end
end
