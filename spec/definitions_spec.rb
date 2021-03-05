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
    it('') do
      definition = Definitions.new("definition", @word.id)
      definition2 = Definitions.new("definition", @word.id)
      expect(definition).to(eq(definition2))
    end
  end
end