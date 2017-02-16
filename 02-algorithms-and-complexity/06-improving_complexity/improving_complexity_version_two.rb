# Create a version that improves the time complexity performance.

def merge_each(collection)
  if collection.length <= 1
   p collection
  else
    mid = (collection.length / 2).floor
    p left = merge_each(collection[0..mid - 1])
    p right = merge_each(collection[mid..collection.length])

    merge_array(left, right)
  end
end

def merge_array(left, right)
  return merge_sort(left + right) if left.first.is_a? Numeric

   if left.first.nil?
     right.first
   elsif right.first.nil?
     left.first
   elsif left.first.first < right.first.first
     left.first + merge_array(left[1..left.length], [right.first])
   else
     right.first + merge_array([left.first], right[1..right.length])
   end
end


def merge_sort(collection)
   if collection.length <= 1
     collection
   else

     mid = (collection.length / 2).floor
     left = merge_sort(collection[0..mid - 1])
     right = merge_sort(collection[mid..collection.length])

     merge(left, right)
   end
 end

 def merge(left, right)
   if left.empty?
     right
   elsif right.empty?
     left
   elsif left.first < right.first
     [left.first] + merge(left[1..left.length], right)
   else
     [right.first] + merge(left, right[1..right.length])
   end
 end
