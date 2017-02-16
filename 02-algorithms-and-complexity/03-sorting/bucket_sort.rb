require 'benchmark'
include Benchmark

#insertion sort
def insertion_sort(array)
  #loop through each element
  array.each_with_index do |el, i|
    x = array[i]
    j = i - 1
    #while x has previous values and if those values are greater than x
    while j >= 0 && array[j] > x
      #set the previous value to the current value
      array[j+1] = array[j]
      j = j - 1
    end
   #set current value to previous value
   array[j + 1] = x
  end
  return array
end

#gets largets value
def find_max(array)
  #initialize max
  max = array[0]
  #for each element in the array
  array.each_with_index do |el, index|
    #if the current value is less than the previous value
    if max < array[index-1]
      #set the previous value to max
      max = array[index-1]
    end
  end
  return max
end

#assign index
def msbits(array, x)
  n = 2*(array.length - find_max(array)).abs
  i = x/n.to_f * 10
  return i.round
end

def bucket_sort(array, n)
  #the number of "buckets" is equal to the number of elements in array
  buckets = []
    (n).times do
    buckets << []
  end
  #for each element in the array
  array.each_with_index do |el, i|
      #assign each element to its corresponding bin
      if el > array.length
        buckets[-1].push(el)
        insertion_sort(buckets[-1])
      else
        buckets[el/10].push(el)
        insertion_sort(buckets[el/10])
      end
      # if the bin is not empty & the incoming value is less than the incumbent value
      # swap values so that the smallest value is at the lowest index
  end
  return buckets.flatten
end


random_numbers = 100000.times.map{Random.rand(200000) }
same_number = 100000.times.map { 1 }
sorted_numbers = Array (1..100000)


Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
  rn = x.report("random numbers")  { bucket_sort(random_numbers, 100000) }
  sn = x.report("same numbers") { bucket_sort(same_number, 100000) }
  srtn = x.report("sorted numbers") { bucket_sort(sorted_numbers, 100000) }
  [rn+sn+srtn, (rn+sn+srtn)/3]
end
