require 'spec_helper'

describe 'version' do
  it 'has a version number' do
    expect(NbaPlayers::VERSION).not_to be nil
  end
end
