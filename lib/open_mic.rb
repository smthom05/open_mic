require 'pry'

class OpenMic

  attr_reader :info

  def initialize(info)
    @info = {
      location: info[:location],
      date: info[:date],
      performers: []
    }
  end

  def welcome(performer)
    @info[:performers] << performer
  end

  def repeated_jokes?

    performer_1_joke_ids = @info[:performers][0].jokes.map { |joke| joke.id}
    performer_2_joke_ids = @info[:performers][1].jokes.map { |joke| joke.id}

    if performer_1_joke_ids.any? == performer_2_joke_ids.any?
      true
    else
      false
    end
  end
end
