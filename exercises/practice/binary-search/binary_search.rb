=begin
Write your code for the 'Binary Search' exercise in this file. Make the tests in
`binary_search_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search` directory.
=end

class BinarySearch
  def initialize(nums)
    @nums = nums
  end

  def search_for(num)
    i = 0
    j = @nums.length - 1

    while i <= j
      mid = i + (j - i) / 2
      if @nums[mid] == num
        return mid
      elsif @nums[mid] > num
        j = mid - 1
      else
        i = mid + 1
      end
    end
    nil
  end
end
