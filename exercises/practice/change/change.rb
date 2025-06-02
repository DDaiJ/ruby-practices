=begin
Write your code for the 'Change' exercise in this file. Make the tests in
`change_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/change` directory.
=end

class Change
  class ImpossibleCombinationError < StandardError; end

  def self.generate(coins, amount)
    amounts = [0]

    puts "\na value==="
    (1..amount).each do |a|
      puts a
      count = Float::INFINITY
      coins.each do |coin|
        count = [count, amounts[a - coin] + 1].min if a >= coin
      end
      amounts << count
    end

    raise ImpossibleCombinationError if amounts[amount] == Float::INFINITY

    amounts[amount]
  end
end
