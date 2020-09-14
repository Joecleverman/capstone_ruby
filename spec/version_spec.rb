require 'spec_helper'

describe NbaPlayers do
  it 'has a version number' do
    expect(NbaPlayers::VERSION).not_to be nil
  end
  it 'it should not raised errors when search for version' do
    expect { NbaPlayers::VERSION }.to_not raise_error
  end
end
