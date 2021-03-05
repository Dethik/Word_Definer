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
  describe '#save' do
    it('saves the word') do
      words = Words.new("words", nil)
      words.save()
      expect(Words.all).to(eq([words]))
    end
  end
end