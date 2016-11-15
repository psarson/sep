require 'benchmark'
require_relative 'min_binary_heap'

heap2 = MinBinaryHeap.new
j = [rand(100), rand(100)]
l = ["apple", rand(100)]
(1..100000).each {|j| heap2.insert(j)}
heap2.insert(l)

Benchmark.bm do |x|
  x.report ("find") {heap2.find("apple")}
end
