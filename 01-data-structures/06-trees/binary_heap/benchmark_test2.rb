require 'benchmark'
require_relative 'min_binary_heap'

heap = MinBinaryHeap.new
i = 0
j = 0
string = 0
while i < 10000
   heap.insert([(string += 1).to_s, j += 1])
   i += 1
end

Benchmark.bm do |x|
  x.report ("find") {heap.find("500")}
end
