# require_relative '../bin/nba_players'

describe 'cli' do
   it 'has a several lists of players' do
    expect(NbaPlayers::Players).not_to be nil
    end
   it 'it should not raised errors when displaying' do
    expect { NbaPlayers::Players }.to_not raise_error
   end
end
