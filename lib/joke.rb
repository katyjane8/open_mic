class Joke
  attr_reader :id, :question, :answer
  
  def initialize(joke)
    @id = joke[:id].to_i
    @question = joke[:question]
    @answer = joke[:answer]
  end

end
