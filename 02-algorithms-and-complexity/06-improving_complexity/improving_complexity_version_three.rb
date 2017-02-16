#Create a version that improves the space complexity.
def merge_each(collection)
  if collection.length <= 1
    collection.first
  else
    mid = (collection.length / 2).floor
    left = merge_each(collection[0..mid - 1])
    right = merge_each(collection[mid..collection.length])

    heap_sort(left + right)
  end 
end

def heap_sort(a)

  p heap_sorted = heapify(a)

  end_ = heap_sorted.length-1

  while end_ > 0
    heap_sorted[end_], heap_sorted[0] = heap_sorted[0], heap_sorted[end_]
    end_ = end_ -1
    siftdown(heap_sorted, 0, end_)
    p heap_sorted
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
