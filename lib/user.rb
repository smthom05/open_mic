class User

  attr_reader :name,
              :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn_joke(joke)
    @jokes << joke
  end


end
