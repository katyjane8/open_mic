require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_sal_has_zero_jokes_as_default
    sal = User.new("Sal")

    assert_equal [], sal.jokes
  end

  def test_sal_can_learn_jokes
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.learn(joke)

    assert_instance_of Array, sal.jokes
    assert_equal [joke], sal.jokes
  end

  def test_sal_can_tell_ali_a_joke_and_she_learns_it
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.tell(ali, joke)

    assert_instance_of Array, ali.jokes
    assert_equal [joke], ali.jokes
    assert_equal 1, ali.jokes.count
  end

  def test_new_users_Ilana_and_Josh
    ilana = User.new("Ilana")
    josh = User.new("Josh")

    assert_equal "Josh", josh.name
    assert_equal "Ilana", ilana.name
  end

  def test_ilana_performs_for_josh_and_he_learns_jokes
    ilana = User.new("Ilana")
    josh = User.new("Josh")
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    ilana.learn(joke_1)
    ilana.learn(joke_2)
    ilana.perform_routine_for(josh)

    assert_instance_of Array, josh.jokes
    assert_equal [joke_1, joke_2], josh.jokes
    assert_equal 2, josh.jokes.count
  end

  def test_casey_is_new_user
    casey = User.new("Casey")

    assert_equal "Casey", casey.name
  end

  def test_casey_has_routine
    casey = User.new("Casey")
    casey.learn_routine('./jokes.csv')

    assert_equal 100, casey.jokes.count
  end 

end
