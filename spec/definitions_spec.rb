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

end