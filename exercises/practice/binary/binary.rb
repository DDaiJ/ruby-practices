=begin
Write your code for the 'Binary' exercise in this file. Make the tests in
`binary_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary` directory.
=end

class Binary
  def self.to_decimal(binary)
    raise ArgumentError, "input is not a valid binary number" if invalid?(binary)

    total = 0
    binary.reverse.each_char.with_index do |num, index|
      total += num.to_i * 2**index
    end
    total
  end

  def self.invalid?(binary)
    binary =~ /[^01]/
  end
end
