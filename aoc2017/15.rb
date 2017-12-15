#!/usr/bin/env ruby -w

Fact_a = 16807
Fact_b = 48271
Div = 2147483647
N1 = 40000000
N2 = 5000000

Start_a = 679
Start_b = 771

prev_a = Start_a
prev_b = Start_b
matches = 0

N1.times do
  new_a = (prev_a * Fact_a) % Div
  prev_a = new_a
  new_b = (prev_b * Fact_b) % Div
  prev_b = new_b
  if ((new_a & 0xffff) ^ (new_b & 0xffff)) == 0 then
    matches += 1
  end
end

puts "part1: #{matches} matches"

prev_a = Start_a
prev_b = Start_b
matches = 0
new_a = new_b = 0

N2.times do
  loop do
    new_a = (prev_a * Fact_a) % Div
    prev_a = new_a
    break if new_a % 4 == 0
  end

  loop do
    new_b = (prev_b * Fact_b) % Div
    prev_b = new_b
    break if new_b % 8 == 0
  end

  if ((new_a & 0xffff) ^ (new_b & 0xffff)) == 0 then
    matches += 1
  end
end

puts "part2: #{matches} matches"

# $ time ruby -w 15.rb 
# part1: 626 matches
# part2: 306 matches

# real	0m14,369s
# user	0m13,597s
# sys	0m0,004s
