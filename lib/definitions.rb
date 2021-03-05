require('pry')

class Definitions
  attr_reader :id
  attr_accessor :text, :word_id

  @@definitions = {}
  @@total = 0

  def initialize(text, word_id, id)
    @text = text
    @word_id = word_id
    @id = id || @@total += 1
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definitions.new(self.spelling, self.id)
  end

  def update(spelling)
    self.spelling = spelling
    @@definitions[self.id] = Definitions.new(self.spelling, self.id)
  end

  def delete
    @@definitions.delete(self.id)
  end
end