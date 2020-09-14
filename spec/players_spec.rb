require_relative '../lib/players.rb'

describe '#players' do
  it 'has a player' do
    expect(NbaPlayers::Players).not_to be nil
  end
  it 'it should not raised errors when it look for players' do
    expect { NbaPlayers::Players }.to_not raise_error
  end
end

describe '#self.create_players_from_collection' do
  it 'returns a hash' do
    expect(NbaPlayers::Players.create_players_from_collection({})).to be_a(Hash)
  end
end
