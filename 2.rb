#!/usr/bin/env ruby -w

sum1 = 0
sum2 = 0
while line = gets
  _l = line.strip.split("\t").map(&:to_i)
  sum1 += _l.max - _l.min

  _l.each do |x|
    _l.each do |y|
      sum2 += x/y if x%y==0 and x!=y
    end
  end
end
puts "1: #{sum1}"
puts "2: #{sum2}"
