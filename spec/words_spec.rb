require 'rspec'
require 'words'
require 'pry'

describe '#Word' do
  before(:each) do
    Words.clear()
  end
  describe '.all' do
    it("returns an empty array") do
      expect(Words.all).to(eq([]))
    end
  end
end