require_relative '../lib/scraper.rb'

describe 'Scraper' do
  let(:scraper) { Scraper.new }

  describe '#scrape_page' do
    it 'should return value from a page' do
      expect(NbaPlayers::Scraper).not_to be nil
    end
    it 'it should not raised errors when scraping an html page' do
      expect { NbaPlayers::Scraper }.to_not raise_error
    end
  end
end
