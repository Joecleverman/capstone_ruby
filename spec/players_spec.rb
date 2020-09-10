require_relative '../lib/players.rb'

describe '#players' do
  it 'has a player' do
    expect(NbaPlayers::Players).not_to be nil
  end
  it 'it should not raised errors when it look for players' do
    expect { NbaPlayers::Players }.to_not raise_error
  end
end
