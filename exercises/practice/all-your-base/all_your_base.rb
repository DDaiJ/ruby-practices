=begin
Write your code for the 'All Your Base' exercise in this file. Make the tests in
`all_your_base_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/all-your-base` directory.
=end

class BaseConverter
  class << self
    def convert(base_from, digits_array, base_to)
      raise ArgumentError if invalid_inputs?(base_from, digits_array, base_to)
      return [0] if digits_array.empty?

      number_in_canonical_base = convert_to_canonical_base(digits_array, base_from)
      convert_from_canonical_base(number_in_canonical_base, base_to)
    end

    private
    def invalid_inputs?(base_from, digits_array, base_to)
      digits_array.any? { |number| number.negative? || number >= base_from } ||
        base_from <= 1 || base_to <= 1
    end

    def convert_to_canonical_base(digits_array, base)
      total = 0
      digits_array.reverse.each_with_index do |number, index|
        total += number * base**index
      end
      total
    end

    def convert_from_canonical_base(number, base_to)
      result = []
      current_number = number
      while current_number >= base_to
        result << current_number % base_to
        current_number /= base_to
      end
      result << current_number
      result.reverse
    end
  end
end
