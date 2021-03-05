require ('pry')

class Definitions
  attr_reader :id
  attr_accessor :text, :word_id

  @@definitions = {}
  @@total = 0

  def initialize(text, word_id, id = nil)
    @text = text
    @word_id = word_id
    @id = id || @@total += 1
  end

  def self.all
    @@definitions.values
  end

  def self.find(id)
    @@definitions[id]
  end

  def self.clear
    @@definitions = {}
  end

  def self.find_by_word(word_id)
    definitions = []
    @@definitions.values.each do |define|
      if define.word_id == word_id
        definitions.push(define)
      end
    end
    definitions
  end

  def ==(def_compare)
    (self.text() == def_compare.text()) && (self.word_id() == def_compare.word_id())
  end

  def save
    @@definitions[self.id] = Definitions.new(self.text, self.word_id, self.id)
  end

  def update(text, word_id)
    self.text = text
    self.word_id = word_id
    @@definitions[self.id] = Definitions.new(self.text, self.word_id, self.id)
  end

  def delete
    @@definitions.delete(self.id)
  end

  def word
    Words.find(self.word_id)
  end
end