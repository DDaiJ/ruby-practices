=begin
Write your code for the 'Affine Cipher' exercise in this file. Make the tests in
`affine_cipher_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/affine-cipher` directory.
=end

class Affine
  attr_reader :a, :b

  def initialize(a, b)
    coprime_check(a)
    @alphabet = ('a'..'z').to_a
    @a = a
    @b = b
    @cipherbet = make_cipherbet.join
  end

  def encode(phrase)
    clean_string(phrase).tr('a-z', @cipherbet).scan(/.{1,5}/).join(' ')
  end

  def decode(phrase)
    clean_string(phrase).tr(@cipherbet, 'a-z')
  end

  private
  def coprime_check(a)
    raise ArgumentError, "Error: a and m must be coprime!" if a.gcd(26) != 1  
  end

  def clean_string(string)
    # to lowercase and remove spaces
    string.downcase.tr('^0-9a-z', '')
  end

  def make_cipherbet
    @alphabet.each_index.map do |index|
      encode_index = (@a * index + @b) % 26
      @alphabet[encode_index]
    end
  end
end
