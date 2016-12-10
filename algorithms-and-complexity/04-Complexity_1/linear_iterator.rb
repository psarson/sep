def linear_search_iterator(array)
  iterations = []
  array.each_with_index do |ary, index|
     target = ary[-1]
     ary.each_with_index do |element, sub_index|
        if target == element
          iterations.push(sub_index + 1)
        end
     end
   end
   p iterations
end

a = Array (1)
b = Array (1..2)
c = Array (1..4)
d = Array (1..8)
e = Array (1..16)
f = Array (1..32)
g = Array (1..64)
h = Array (1..128)
i = Array (1..256)
j = Array (1..512)
k = Array (1..1024)

linear_search_iterator([a, b, c, d, e, f, g, h, i, j, k])
