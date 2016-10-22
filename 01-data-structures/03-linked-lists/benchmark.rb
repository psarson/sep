require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

array = (1..10000).map { rand }

list = LinkedList.new

i = 0
j = 0
while i < 10000
	list.add_to_tail(Node.new(j += 1))
	i += 1
end

Benchmark.bmbm do |x|
  x.report("Array, Remove Middle Value") {array.dup.delete_at(4999)}
  x.report("LinkedList, Remove Middle Value:") { list.dup.remove_by_val(5000) }
  x.report("LinkedList, Find Middle Value:") { list.dup.find_by_val(5000)}
end
