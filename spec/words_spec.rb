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
      words = Words.new("words")
      words.save()
      expect(Words.all).to(eq([words]))
    end
  end
  describe '#==' do
    it "returns true if they are the same word" do
      word1 = Words.new("word")
      word2 = Words.new("word")
      expect(word1 == word2).to(eq(true))
    end
    it "returns false if they are not the same word" do
      word1 = Words.new("word")
      word2 = Words.new("pug")
      expect(word1 == word2).to(eq(false))
    end
  end
  describe '.clear' do
    it "clears all words from cache" do
      word1 = Words.new("word")
      word2 = Words.new("word")
      word1.save()
      word2.save()
      Words.clear()
      expect(Words.all).to eq([])
    end
  end
  describe '.find' do
    it "finds a word by id" do
      word1 = Words.new("word")
      word2 = Words.new("word")
      word1.save()
      word2.save()
      expect(Words.find(word1.id)).to eq(word1)
      expect(Words.find(word2.id)).to eq(word2)
    end
  end
end