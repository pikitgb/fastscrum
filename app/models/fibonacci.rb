class Fibonacci
  def self.fibonacci_base(limit = nil)
    seed1 = 0
    seed2 = 1
    while not limit or seed2 <= limit
      yield seed2
      seed1, seed2 = seed2, seed1 + seed2
    end
  end

  def self.fibonacci(n)
    list = []
    fibonacci_base(n) { |x| list << x }
    list
  end
end

#puts Fibonacci.fibonacci(5).join(", ")
