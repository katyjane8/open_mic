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

  # > sal.jokes
  # # => []
  #
  # > sal.learn(joke)
  # > sal.jokes
  # # => [#<Joke:0x007fc87b02c2e0 ...>]

end
