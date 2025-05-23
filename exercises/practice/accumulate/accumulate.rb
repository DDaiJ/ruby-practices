=begin
Write your code for the 'Accumulate' exercise in this file. Make the tests in
`accumulate_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/accumulate` directory.
=end

class Array
  def accumulate
    result = []
    each do |e|
      result << yield(e)
    end
    result
  end
end
