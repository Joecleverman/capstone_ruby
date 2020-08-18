require_relative '../lib/nba_players/scraper.rb'

describe 'Scraper' do
  let(:scraper) { Scraper.new('https://www.washingtonpost.com/graphics/2017/sports/nba-top-100-players-2017/?noredirect=on&utm_term=.adcc13ae7e38') }

  describe 'scraper' do
    it 'should return value from a page' do
      expect(NbaPlayers::Scraper).not_to be nil
    end
    it 'uses Nokogiri to get the HTML from a web page' do
      expect { NbaPlayers::Scraper }.to_not raise_error
    end
  end
end
