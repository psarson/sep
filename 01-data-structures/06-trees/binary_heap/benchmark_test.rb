require 'benchmark'
require_relative 'min_binary_heap'

heap = MinBinaryHeap.new

Benchmark.bm do |x|
  x.report ("insert") {100000.times do |i| j = [rand(100000).to_s, rand(100000)]; heap.insert(j); end }
end
