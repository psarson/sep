require 'benchmark'

def fib(n)
  fib_0 = 0
  fib_1 = 1

  if n == 0
      return 0
  else
    (n-1).times do
      temp = fib_0 + fib_1
      fib_0 = fib_1
      fib_1 = temp
    end
  end

  return fib_1
end


def fib_recursive(n)
  if (n == 0)
     return 0
   elsif (n == 1)
     return 1
   else
     return fib(n-1) + fib(n-2)
   end
end

n = 20

Benchmark.bm do |x|
  x.report("iterative:") { fib(n) }
  x.report("recursive:") { fib_recursive(n) }
end

=begin
results

                user     system      total        real
iterative:  0.000000   0.000000   0.000000 (  0.000008)
recursive:  0.000000   0.000000   0.000000 (  0.000006)
[Finished in 0.069s]
=end 
