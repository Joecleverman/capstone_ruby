require_relative '../lib/nba_players/players.rb'

describe 'players' do
  it 'has a player' do
    expect(NbaPlayers::Players).not_to be nil
  end
end
