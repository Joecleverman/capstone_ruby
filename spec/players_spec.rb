# require_relative '../lib/nba_players/players.rb'

# describe Players do
#     it 'checks player name' do
#       inport_names = Player.new('someone')
#       names = inport_names.instance_variable_get(:@name)
#       expect(names).to eq('someone')
#     end
#     it 'checks name of players' do
#       input = Player.new('someone')
#       name = input.instance_variable_get(:@name)
#       expect(name).to be_a String
#     end
#   end

# require_relative '../lib/nba_players/players.rb'

# describe 'Players' do
#   describe '#Initializer' do
#     let(:players) { Players.new }
#     it 'Create a  new player' do
#       expect(create_players_from_collection.players).to eq(nil)
#     end
#     it 'Assingn  a  new title for the music' do
#       expect(Music.new('fantom').title).to eq('fantom')
#     end
#     it 'Assingn  a  new link for the music' do
#       expect(Music.new('fantom', 'https://achvimizik.net').link).to eq('https://achvimizik.net')
#     end
  # end

#   context 'class methods' do
#     describe '.all ' do
#       it 'returns an array of all the instances of the Music class' do
#         Music.reset
#         music_one = Music.new
#         music_two = Music.new
#         music_three = Music.new
#         expect(Music.all).to match_array([music_one, music_two, music_three])
#       end
#     end
#   end

#   context 'class methods' do
#     describe '.Single-Music ' do
#       it 'returns a single instances of the Music class' do
#         Music.reset
#         Music.new('fantom', 'link')
#         expect(Music.all[0].title).to eq('fantom')
#       end
#     end
#   end
# end