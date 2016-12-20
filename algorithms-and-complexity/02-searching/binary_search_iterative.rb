#DEF BINARY_SEARCH(collection, value)
 #low = 0
 #high = length_of(collection) - 1

 #WHILE low <= high
   #mid = (low + high) / 2
   #IF collection[mid] > value THEN
     #high = mid - 1
   #ELSE IF collection[mid] < value
     #low = mid + 1
   #ELSE
     #return mid
   #END IF
 #END WHILE

 #return not_found


 def binary_search(collection, value)
    low = 0
    high = collection.length-1

    while low <= high
      mid = (low + high) / 2
      if collection[mid] > value
        high = mid -1
      elsif collection[mid] < value
        low = mid + 1
      else
        return mid
      end
    end
    return "not found"
 end
