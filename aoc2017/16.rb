#!/usr/bin/env ruby -w

input = File.read("data/16.txt").strip.split(",")

dancers = ('a'..'p').to_a.join
seen = []
N = 1_000_000_000

N.times do |counter|
  if seen.include?(dancers) then
    dancers = seen[N % counter]
    break
  else
    seen << String.new(dancers)
  end
  
  input.each do |move|
    case move[0]
    when 's'
      x = move[1..-1].to_i
      dancers = dancers.chars.rotate(-x).join

    when 'x'
      pos_a, pos_b = move[1..-1].scan(/\w+/).map(&:to_i)
      dancers[pos_a], dancers[pos_b] = dancers[pos_b], dancers[pos_a]
    when 'p'
      prog_a, prog_b = move[1..-1].scan(/\w+/)
      ia = dancers.index(prog_a)
      ib = dancers.index(prog_b)
      dancers[ia], dancers[ib] = dancers[ib], dancers[ia]
    end
  end
end

puts "part1: #{seen[1]}"
puts "part2: #{dancers}"

# Optimization idea: run over the inpu sequence once and note the operations.
# Next times only call them - no multiple parsing of the same string.

# Correct:
# part1: cgpfhdnambekjiol
# part2: gjmiofcnaehpdlbk
