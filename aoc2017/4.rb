#!/usr/bin/env ruby -w

def valid(pass)
  pass.length == pass.uniq.length
end

def valid2(pass)
  return false if not valid(pass)
  pass.each do |word|
    _w = word.split('').sort.join
    pass.each do |word2|
      _w2 = word2.split('').sort.join
      return false if word != word2 and _w == _w2
    end
  end
  return true
end

sum1 = sum2 = 0
while line = gets.strip.split
  sum1 += 1 if valid(line)
  sum2 += 1 if valid2(line)
end

puts "sum1: #{sum1}"
puts "sum2: #{sum2}"
