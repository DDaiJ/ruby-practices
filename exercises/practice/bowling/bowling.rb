=begin
Write your code for the 'Bowling' exercise in this file. Make the tests in
`bowling_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bowling` directory.
=end

class Game
  PINS = { MIN: 0, MAX: 10 }.freeze
  at_exit { public :roll, :score }

  class BowlingError < StandardError; end
  class RollError < BowlingError; end
  class GameError < BowlingError; end

  private
  def initialize
    @score_card = Hash.new { |frame_number, k| frame_number[k] = [] }
    @score_card[1]
  end

  def roll(pins)
    validate(pins)
    @score_card[current_frame] << pins
    @score_card[current_frame + 1] unless last_frame? || !frame_complete?
  end

  def validate(pins)
    raise RollError, "Invalid number of pins" unless (PINS[:MIN]..PINS[:MAX]).cover?(pins)
    raise RollError, "Too many pins in frams" unless valid_frame?(pins)
    raise GameError, "Game is over, no rolls allowed" if game_complete?
  end

  def valid_frame?(pins)
    last_roll_was_strike = @score_card[current_frame].last == 10

    last_frame? && (last_roll_was_strike || spare?) ||
      @score_card[current_frame].last.to_i + pins <= PINS[:MAX]
  end

  def current_frame
    @score_card.keys.max
  end

  def last_frame?
    current_frame == 10
  end

  def frame_complete?
    if last_frame?
      # two turns taken with no strike or spare, or done 3 rolls
      frame_filled && open_frame? || frame_filled(3)
    else
      frame_filled || strike?
    end
  end

  def strike?
    @score_card[current_frame].first == 10
  end

  def spare?
    @score_card[current_frame].sum == 10
  end

  def open_frame?
    !(strike? || spare?)
  end

  def frame_filled(rolls = 2)
    @score_card[current_frame].size == rolls
  end

  def game_complete?
    last_frame? && frame_complete?
  end

  def score
    raise GameError, "Score unavailable until end of the game" unless game_complete?
    @score_card.values.map.with_index(1) do |f, i|
      score_frame(f, i)
    end.sum
  end

  def score_frame(f, i)
    strike_or_spare = f.first == PINS[:MAX] || f.sum == PINS[:MAX]

    if strike_or_spare
      special(@score_card[i], @score_card[i + 1], @score_card[i + 2])
    else
      f.sum
    end
  end

  def special(*frames)
    first_three_scores = 0..2
    frames.flatten[first_three_scores].reduce(:+)
  end
end
