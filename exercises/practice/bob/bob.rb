=begin
Write your code for the 'Bob' exercise in this file. Make the tests in
`bob_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bob` directory.
=end

module Bob
  def hey(remark)
    answer Phrase.new(remark)
  end

  def answer(phrase)
    if phrase.silent?
      'Fine. Be that way!'
    elsif phrase.loud? && phrase.question?
      'Calm down, I know what I\'m doing!'
    elsif phrase.loud?
      'Whoa, chill out!'
    elsif phrase.question?
      'Sure.'
    else
      'Whatever.'
    end
  end
end

class Phrase
  attr_reader :source

  def initialize(drivel)
    @source = drivel.to_s.strip
  end

  def question?
    source.end_with?('?')
  end

  def loud?
    source =~ /[A-Z]/ && source.upcase == source
  end

  def silent?
    source.empty?
  end
end

# It takes the Bob module and extends itself with its own methods
# This means all the methods defined in the Bob module become module methods, not just instance methods
# Enable calling Bob.hey(...) directly
Bob.extend Bob
