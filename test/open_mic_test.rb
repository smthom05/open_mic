require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/joke'
require './lib/user'
require './lib/open_mic'

class OpenMicTest < Minitest::Test

  def setup
    @open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    @sal = User.new("Sal")
    @ali = User.new("Ali")

    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")

  end

  def test_it_exists
    assert_instance_of OpenMic, @open_mic
  end

  def test_open_mic_has_a_location
    assert_equal "Comedy Works", @open_mic.info[:location]
  end

  def test_open_mic_has_a_date
    assert_equal "11-20-18", @open_mic.info[:date]
  end

  def test_open_mic_does_not_have_performers_to_start
    assert_equal [], @open_mic.info[:performers]
  end

  def test_open_mic_can_get_performers
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)

    assert_equal [@sal, @ali], @open_mic.info[:performers]
  end

  def test_have_jokes_been_repeated_to_start
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)
    @ali.learn(@joke_1)
    @ali.learn(@joke_2)

    assert_equal false, @open_mic.repeated_jokes?
  end

  def test_have_jokes_been_repeated_to_start
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)
    @ali.learn(@joke_1)
    @ali.learn(@joke_2)
    @ali.tell(@sal, @joke_1)

    assert_equal true, @open_mic.repeated_jokes?
  end
end
