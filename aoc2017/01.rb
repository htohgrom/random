#!/usr/bin/env ruby

def prep(input)
  input.strip.chars.map(&:to_i)
end

def test(input, expect, fun)
  result = fun.call(prep(input))
  result_str = result == expect ? "[ OK ]" : "[FAIL]"
  puts "#{result_str} input: #{input} result: #{result} expected: #{expect}"
end

def solver(input, opt)
  res = 0
  offset = {:part1 => 1, :part2 => input.length/2}
  (0...input.length).each do |i|
    res += input[i] if input[i] == input[i-offset[opt]]
  end
  res
end

input = prep(File.read("data/1.input"))

puts "*** Test ***"
puts "1:"
f = lambda {|x| solver(x, :part1)}
test("1122", 3, f)
test("1111", 4, f)
test("1234", 0, f)
test("91212129", 9, f)
puts "2:"
f = lambda {|x| solver(x, :part2)}
test("1212", 6, f)
test("1221", 0, f)
test("123425", 4, f)
test("123123", 12, f)
test("12131415", 4, f)

puts
puts "*** Result ***"
puts "1: #{solver(input, :part1)}"
puts "2: #{solver(input, :part2)}"
