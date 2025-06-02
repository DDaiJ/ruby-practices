require 'set'
=begin
Write your code for the 'Book Store' exercise in this file. Make the tests in
`book_store_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/book-store` directory.
=end

module BookStore
  DISCOUNTS = [1.0, 0.95, 0.9, 0.8, 0.75]
  INDIVIDUAL_PRICE = 8

  def self.calculate_price(basket)
    groups = []

    while (new_group = basket.uniq).any?
      new_group.each { |book| basket.delete_at(basket.index(book)) }
      groups << new_group.size
    end

    while Set[3, 5] <= Set.new(groups)
      groups.delete_at(groups.index(3))
      groups.delete_at(groups.index(5))
      groups.push(4, 4)
    end

    groups.sum { |group| INDIVIDUAL_PRICE * group * DISCOUNTS[group - 1]}
  end
end
