#!/usr/bin/env ruby -w

# input = [0, 2, 7, 0]

input = File.read("data/6.input").strip.split.map(&:to_i)

step = 0
len = input.length
all_prev = []

loop do
  all_prev << input.dup
  bank = input.find_index(input.max)
  blocks = input[bank]
  input[bank] = 0
  blocks.times do |i|
    bank = (bank+1)%len
    input[bank] += 1
  end
  step += 1
  break if all_prev.include?(input)
end

puts step
p input
p all_prev.length - all_prev.find_index(input)

# TODO Optimize me maybe?
