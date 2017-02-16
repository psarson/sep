##Create a version of the code above that has code optimizations.

# My Code:
def sort_the_arrays(*arrays)
  [arrays].flatten.sort
end

# Bad code: 
def poorly_written_ruby(*arrays)
   combined_array = []
   arrays.each do |array|
     array.each do |value|
       combined_array << value
     end
   end

   sorted_array = [combined_array.delete_at(combined_array.length-1)]

   for val in combined_array
     i = 0
     while i < sorted_array.length
       if val <= sorted_array[i]
         sorted_array.insert(i, val)
         break
       elsif i == sorted_array.length - 1
         sorted_array.insert(i, val)
         break
       end
       i+=1
     end
   end

   # Return the sorted array
   sorted_array
 end


 #[10, 9, 42, 67, 1, 5]
 #[5]
 #[5]
 #"fired at 0"
 #[10, 5]
 #[9, 10, 5]
 #"fired at 2"
 #[9, 10, 42, 5]
 #"fired at 3"
 #[9, 10, 42, 67, 5]
 #=> [1, 9, 10, 42, 67, 5]

## Now then, this isn't quite a fair solution to the problem, since I'm assuming
# we are looking for something more language agnostic.
def sort_the_arrays(*arrays)
  [arrays].flatten.sort
end
