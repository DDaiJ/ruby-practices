=begin
Write your code for the 'Binary Search Tree' exercise in this file. Make the tests in
`binary_search_tree_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search-tree` directory.
=end

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Bst
  attr_reader :root

  def initialize(data)
    @root = Node.new(data)
  end

  def insert(num)
    curr = root

    loop do
      if num <= curr.data
        unless curr.left
          curr.left = Node.new(num)
          break
        end
        curr = curr.left
      else
        unless curr.right
          curr.right = Node.new(num)
          break
        end
        curr = curr.right
      end
    end
  end
end
