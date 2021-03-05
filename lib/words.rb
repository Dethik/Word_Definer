require('pry')

class Words
  attr_reader :id
  attr_accessor :spelling

  @@words = {}
  @@total = 0

  def initialize(spelling, id)
    @spelling = spelling
    @id = id || @@total += 1
  end

  def self.all
    @@words.values
  end

  def save
    @@words[self.id] = Word.new(self.spelling, self.id)
  end

  def update(spelling)
    self.spelling = spelling
    @@words[self.id] = Word.new(self.spelling, self.id)
  end

  def delete
    @@words.delete(self.id)
  end
end