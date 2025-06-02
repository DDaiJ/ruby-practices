=begin
Write your code for the 'Atbash Cipher' exercise in this file. Make the tests in
`atbash_cipher_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/atbash-cipher` directory.
=end

class Atbash
  class << self
    def encode(plaintext)
      new(plaintext).encode
    end

    def decode(ciphertext)
      new(ciphertext).decode
    end
  end

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def encode
    chunk(convert)
  end

  def decode
    convert
  end

  def chunk(s)
    s.scan(/.{1,5}/).join(' ')
  end

  private
  def convert
    normalize.tr(alphabet, key)
  end

  def normalize
    text.downcase.gsub(/[^a-z0-9]/, '')
  end

  def alphabet
    ('a'..'z').to_a.join
  end

  def key
    alphabet.reverse
  end
end
