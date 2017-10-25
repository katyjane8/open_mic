class User
  attr_reader :name

  def initialize(name)
    @name = name
    @jokes = []
  end

  def jokes
    @jokes
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(name, joke)
    name.learn(joke)
  end

  def perform_routine_for(name)
    jokes.map do |joke|
      tell(name, joke)
    end
  end


end
