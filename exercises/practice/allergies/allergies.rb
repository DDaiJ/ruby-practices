=begin
Write your code for the 'Allergies' exercise in this file. Make the tests in
`allergies_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/allergies` directory.
=end

class Allergies
  ALLERGENS = %w(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)

  def initialize(score)
    @score = score
  end

  def allergic_to?(item)
    index = ALLERGENS.index(item)
    @score & (2**index) > 0
  end

  def list
    ALLERGENS.select do |item|
      allergic_to?(item)
    end
  end
end