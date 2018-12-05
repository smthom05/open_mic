class User

  attr_reader :name,
              :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(user, joke)
    user.jokes << joke
  end

  def joke_by_id(id)
    jokes_by_id = []
    @jokes.each do |joke|
      if joke.id == id
        jokes_by_id << joke
      end
    end
    jokes_by_id
  end


end
