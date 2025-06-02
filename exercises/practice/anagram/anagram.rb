=begin
Write your code for the 'Anagram' exercise in this file. Make the tests in
`anagram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/anagram` directory.
=end
class Anagram
  def initialize(anagram)
    @anagram = anagram.downcase
    @sorted_anagram = @anagram.chars.sort.join
  end

  def match(candidate_array)
    candidate_array.select do |item|
      item.downcase != @anagram && item.downcase.chars.sort.join == @sorted_anagram
    end
  end
end
