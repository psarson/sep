require 'benchmark'
require_relative 'binary_search_tree'
require_relative 'node'

test_array = []
10000.times { test_array << (rand 10000) }


node = Node.new(test_array.last.to_s, test_array.last)
root = Node.new(test_array.first.to_s, test_array.first)
tree = BinarySearchTree.new(root)

i = 0
j = 0
string = 0
while i < 10000
	tree.insert(root, Node.new((string += 1).to_s, j += 1))
	i += 1
end

Benchmark.bm do |benchmark|
  benchmark.report("find") { tree.find(root, "500") }
end
