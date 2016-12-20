#DEF BINARY(array, target)
#  IF array.length is equal to one and target does not equal first element of the array
#     RETURN nil
#
#
#  ELSE IF target is equal to the first or last element in the array
#     RETURN first or last element
#
#  GET middle element
#
#  IF target is equal to middle element
#     RETURN middle element
#  ELSE IF target is less than middle element
#     RETURN binary(array[0...middle], target)
#   ELSE
#     RETURN binary(array[middle...last], target)
#
#   END IF
#END DEF

def binary(array, target)

  if target != array.first && array.length == 1
    return nil
  elsif target == array.first
    return array.first
  elsif target == array.last
     return array.last
  end

  middle = array[array.index(array[-1])/2]

  if target == middle
    return middle
  elsif array.index(target) < array.index(middle)
    return binary(array[0...array.index(array[-1])/2], target)
  elsif array.index(target) > array.index(middle)
    return binary(array[array.index(array[-1])/2...array.index(array[-1])], target)
  end
end
