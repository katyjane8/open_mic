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
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.tell(ali, joke)

    assert_instance_of Array, ali.jokes
    assert_equal [joke], ali.jokes
    assert_equal 1, ali.jokes.count
  end


end
