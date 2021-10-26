#!/usr/bin/env ruby

class Base
  def fib(n)
    raise "not implemented"
  end
end

class FibonacciBu < Base
  def fib(n)
    f1, f2 = 0, 1
    n.times{ f1, f2 = f2, f1 + f2 }

    f1
  end
end

class Fibonacci < Base
  def fib(n)
    n < 2 ? n : fib(n-1) + fib(n-2)
  end
end

class Memoized < Base
  attr_reader :memo

  def initialize
    @memo = {}
  end

  def fib(n)
    return memo[n] if @memo.has_key?(n)
    n < 2 ? n : @memo[n] = fib(n-1) + fib(n-2)
  end
end

class FibonacciPrint
  attr_accessor :max_terms, :algo

  def initialize max_terms, algo
    @max_terms = max_terms
    @algo = algo
  end

  def compute
    (1..@max_terms).each{ |i| puts @algo.fib(i) }
  end
end

fp = FibonacciPrint.new(33, FibonacciBu.new)
fp.compute

fp.algo = Fibonacci.new
fp.compute

fp.algo = Memoized.new
fp.compute
