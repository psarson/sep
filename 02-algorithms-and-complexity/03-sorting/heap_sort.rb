require 'benchmark'
include Benchmark

def heapsort(a)

  heap_sorted = heapify(a)

  end_ = heap_sorted.length-1

  while end_ > 0
    heap_sorted[end_], heap_sorted[0] = heap_sorted[0], heap_sorted[end_]
    end_ = end_ -1
    siftdown(heap_sorted, 0, end_)
  end
  return heap_sorted
end


def heapify(a)
  start = parent_index(a.length-1)

  while start >= 0
    siftdown(a, start, a.length-1)
    start = start - 1
  end
  return a
end

def siftdown(a, start, end_)
  root = start

  while left_child_index(root) <= end_
    child = left_child_index(root)
    swap = root

    if a[swap] < a[child]
      swap = child
    end
    if child+1 <= end_ && a[swap] < a[child+1]
      swap = child + 1
    end

    if swap == root
      return a
    else
      a[root], a[swap] = a[swap], a[root]
      root = swap
    end
  end
  return a
end

def left_child_index(i)
  2 * i + 1
end

def parent_index(i)
  if i == 0
    return 0
  else
    i/2
  end
end

array = [4, 1, 2, 48, 53, 5, 32, 29, 3]

array1 = [4, 1, 2, 48]


#siftdown(array1, start, array1.index(array1.last))
  #returns:
  #=> [4, 48, 2, 1]
  #=> [4, 1, 2, 48, 53, 5, 32, 29, 3]

#heapify(array)
  #returns:
  #=> [48, 4, 2, 1]
  #=> [53, 48, 32, 29, 1, 5, 2, 4, 3] - corrected

#heapsort(array)
  #returns
  #=> [1, 2, 3, 4, 5, 29, 32, 48, 53]

  random_numbers = 1000000.times.map{Random.rand(2000000) }
  same_number = 1000000.times.map { 1 }
  sorted_numbers = Array (1..1000000)
  #=* (1..100)


  Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
    rn = x.report("random numbers")  { heapsort(random_numbers) }
    sn = x.report("same numbers") { heapsort(same_number) }
    srtn = x.report("sorted numbers") { heapsort(sorted_numbers) }
    [rn+sn+srtn, (rn+sn+srtn)/3]
  end
