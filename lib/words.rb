require('pry')

class Words
  attr_reader :id
  attr_accessor :spelling

  @@words = {}
  @@total = 0

  def initialize(spelling, id = nil)
    @spelling = spelling
    @id = id || @@total += 1
  end

  def self.all
    @@words.values
  end
  def self.find(id)
    @@words[id]
  end
  def self.clear
    @@words = {}
    @@total_rows = 0
  end
  def self.search(query)
    @@words.values.select { |words| words.spelling == query }
  end
  def self.sort
    @@words.values.sort
  end
  def save
    @@words[self.id] = Words.new(self.spelling, self.id)
  end
  def update(spelling)
    self.spelling = spelling
    @@words[self.id] = Words.new(self.spelling, self.id)
  end
  def delete
    @@words.delete(self.id)
  end
  def ==(word_compare)
    self.spelling == word_compare.spelling
  end
  def definitions
    Definitions.find_by_word(self.id)
  end
end