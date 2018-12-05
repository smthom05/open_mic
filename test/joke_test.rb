require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test

  def setup
    @joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
  end

  def test_it_exists
    assert_instance_of Joke, @joke
  end

  def test_what_is_the_joke_id
    assert_equal 1, @joke.id
  end

  def test_what_is_joke_setup
    assert_equal "Why did the strawberry cross the road?", @joke.setup
  end

  def test_what_is_joke_punchline
    assert_equal "Because his mother was in a jam.", @joke.punchline
  end

  end
