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
  describe '#==' do
    it "returns true if they are the same word" do
      word1 = Words.new("word", nil)
      word2 = Words.new("word", nil)
      expect(word1 == word2).to(eq(true))
    end
    it "returns false if they are not the same word" do
      word1 = Words.new("word", nil)
      word2 = Words.new("pug", nil)
      expect(word1 == word2).to(eq(false))
    end
  end
end