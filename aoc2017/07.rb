#!/usr/bin/env ruby -w

input = File.read("data/07.txt").strip.split("\n")
p input.length

# Leave only processes carring other processes
carrying = input.select {|s| s.include?("->")}
p carrying.length

procs = []
nextprocs = []
carrying.each do |proc|
  dupa = proc.split("->")
  procname = dupa[0].split[0]

  procs << procname

  nextprocs << dupa[1].gsub(",", "").split
end

nextprocs = nextprocs.flatten.uniq

puts "procs count: #{procs.length}"
puts "nextprocs count: #{nextprocs.length}"

procs = procs.reject {|p| nextprocs.include?(p)}
p procs

# This is extremely ugly brute-force and doesn't help a bit with part 2.
