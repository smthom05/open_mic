require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'
require 'pry'

class UserTest < Minitest::Test

  def setup
    @sal = User.new("Sal")
  end

  def test_it_exists
    assert_instance_of User, @sal
  end

  def test_does_sal_got_jokes_to_start
    assert_equal [], @sal.jokes
  end

  def test_can_sal_learn_some_jokes
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")

    @sal.learn(joke_1)
    @sal.learn(joke_2)

    assert_equal [joke_1, joke_2], @sal.jokes
  end

  def test_can_sal_tell_ali_a_joke
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")

    @sal.tell(ali, joke_1)
    @sal.tell(ali, joke_2)

    assert_equal [joke_1, joke_2], ali.jokes
  end

  def test_get_joke_by_id
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")

    @sal.tell(ali, joke_1)
    @sal.tell(ali, joke_2)

    assert_equal [joke_1], ali.joke_by_id(1)
  end

end
