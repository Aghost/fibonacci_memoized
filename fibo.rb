#!/usr/bin/env ruby

class Base
  def fib(n)
    raise "not implemented"
  end
end

class Fibonacci < Base
  def fib(n)
    return 0 if n == 0
    return 1 if n == 1

    return fib(n-1) + fib(n-2)
  end
end

class Memoized < Base
  attr_reader :memo

  def initialize
    @memo = {}
  end

  def fib(n)
    return @memo[n] if @memo.has_key?(n)
    return 0 if n == 0
    return 1 if n == 1

    return @memo[n] = fib(n-1) + fib(n-2)
  end
end

class FibonacciPrint
  attr_accessor :max_terms, :algo

  def initialize max_terms, algo
    @max_terms = max_terms
    @algo = algo
  end

  def compute
    (1..@max_terms).each { |i| puts @algo.fib(i) }
  end
end

fp = FibonacciPrint.new(33, Fibonacci.new)
fp.compute

fp.algo = Memoized.new
fp.compute
