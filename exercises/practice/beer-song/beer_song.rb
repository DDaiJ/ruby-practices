=begin
Write your code for the 'Beer Song' exercise in this file. Make the tests in
`beer_song_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/beer-song` directory.
=end

class BeerSong
  def self.recite(total, rounds)
    beer_song = new(total, rounds)
    beer_song.recite
  end

  attr_reader :total, :rounds

  def initialize(total, rounds)
    @total = total
    @rounds = rounds
  end

  def recite
    lines = []
    total.downto(total - rounds + 1).each do |i|
      if i.zero?
        lines << generate_end_line
        break
      end
      lines << generate_line(i)
    end
    lines.join("\n")
  end

  def generate_line(num_bottle)
    "#{bottle(num_bottle)} of beer on the wall, #{bottle(num_bottle)} of beer.\n" \
    "Take #{singular?(num_bottle) ? 'it' : 'one'} down and pass it around, #{bottle(num_bottle - 1)} of beer on the wall.\n"
  end

  def generate_end_line
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def singular?(num_bottle)
    num_bottle == 1
  end

  def bottle(num_bottle)
    if num_bottle.zero?
      'no more bottles'
    else
      "#{num_bottle} #{singular?(num_bottle) ? 'bottle' : 'bottles'}"
    end
  end
end
