require ('rspec')
require ('definitions')
require ('words')
require ('pry')

describe '#Definition' do
  before(:each) do
    Words.clear
    Definitions.clear
    @word = Words.new("temp")
    @word.save()
  end

  describe('#==') do
    it('Return the same definition if the attributes are the same') do
      definition = Definitions.new("definition", @word.id)
      definition2 = Definitions.new("definition", @word.id)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definitions.new("definition", @word.id)
      definition.save()
      definition2 = Definitions.new("definition", @word.id)
      definition2.save()
      expect(Definitions.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definitions.new("Giant Steps", @word.id)
      definition.save()
      definition2 = Definitions.new("definition", @word.id)
      definition2.save()
      Definitions.clear()
      expect(Definitions.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definitions.new("definition", @word.id)
      definition.save()
      expect(Definitions.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definitions.new("definition", @word.id)
      definition.save()
      definition2 = Definitions.new("definition", @word.id)
      definition2.save()
      expect(Definitions.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates an definition by id") do
      definition = Definitions.new("definition", @word.id)
      definition.save()
      definition.update("new_definitions")
      expect(definition.text).to(eq("new_definitions"))
    end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      definition = Definitions.new("definition", @word.id)
      definition.save()
      definition2 = Definitions.new("definition", @word.id)
      definition2.save()
      definition.delete()
      expect(Definitions.all).to(eq([definition2]))
    end
  end

  describe('#definitions') do
    it("returns word's definitions") do
      word = Words.new("this")
      word.save()
      definition = Definitions.new("definition", word.id)
      definition.save()
      definition2 = Definitions.new("Cousin Mary", word.id)
      definition2.save()
      expect(word.definitions).to(eq([definition, definition2]))
    end
  end

  describe('#word') do
    it("finds the word a definition belongs to") do
      definition = Definitions.new("definition", @word.id)
      definition.save()
      expect(definition.word()).to(eq(@word))
    end
  end

end