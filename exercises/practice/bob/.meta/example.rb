module Bob
  def hey(drivel)
    answer Phrase.new(drivel)
  end

  def answer(phrase)
    if phrase.silent?
      'Fine. Be that way!'
    elsif phrase.loud? && phrase.quizzical?
      'Calm down, I know what I\'m doing!'
    elsif phrase.loud?
      'Whoa, chill out!'
    elsif phrase.quizzical?
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

  def quizzical?
    source.end_with?('?')
  end

  def loud?
    source =~ /[A-Z]/ && source.upcase == source
  end

  def silent?
    source.empty?
  end
end

Bob.extend Bob
