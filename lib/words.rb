require('pry')

class Words
  attr_reader :id
  attr_accessor :spelling

  @@words = {}
  @@total = 0

  def initialize(spelling, id)
    @spelling = spelling
    @id = id || @@total_rows += 1
  end

  def self.all
    @@words.values
  end