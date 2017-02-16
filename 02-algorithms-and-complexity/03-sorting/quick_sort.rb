require 'benchmark'
include Benchmark

def pivot_no(array)
  return array if array.length <= 1
  i = array.index(array.first) - 1
  array.each_with_index do |j, i_j|
    if j <= array[array.index(array.last)]
     i += 1
     array[i], array[i_j] = array[i_j], array[i]
    end
  end
  return i
end

def partion(array)
  return array if array.length <= 1
  i = array.index(array.first) - 1
  array.each_with_index do |j, i_j|
    if j <= array[array.index(array.last)]
      i += 1
      array[i], array[i_j] = array[i_j], array[i]
    end
  end
  return array
end

def quicksort(array)
  if array.length <= 1
    return array
  else
    pivot = pivot_no(array)
    if pivot - 1 <= 0
      left = quicksort(partion([array.first]))
    else
      left = quicksort(partion(array[0..pivot-1]))
    end

    if pivot + 1 >= array.length-1
      right = quicksort(partion([array.last]))
    else
      right = quicksort(partion(array[pivot+1..array.length-1]))
    end
   sorted = left.concat(right)
  end
  return sorted
end


#*****


def quicksort2(array)
    return [] if array.empty?

    pivot = array.delete_at(rand(array.length))
    left, right = array.partition(&pivot.method(:>))

    return *quicksort2(left), pivot, *quicksort2(right)
end




random_numbers = 100000.times.map{Random.rand(200000) }
same_number = 100000.times.map { 1 }
sorted_numbers =* (1..100000)


Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
  rn = x.report("random numbers")  { quicksort(random_numbers) }
  sn = x.report("same numbers") { quicksort(same_number) }
  srtn = x.report("sorted numbers") { quicksort(sorted_numbers) }
  [rn+sn+srtn, (rn+sn+srtn)/3]
end
