#!/usr/bin/env ruby -w
#
# Hex bible:
# https://www.redblobgames.com/grids/hexagons/

# Using axial coordinates
directions = {
  "n"  => lambda {|x, y| [x,   y+1]},
  "ne" => lambda {|x, y| [x+1, y  ]},
  "se" => lambda {|x, y| [x+1, y-1]},
  "s"  => lambda {|x, y| [x,   y-1]},
  "sw" => lambda {|x, y| [x-1, y  ]},
  "nw" => lambda {|x, y| [x-1, y+1]}
}

# Distance from [0, 0] in axial coordinates
def dist(x, y)
  z = -x-y
  [x.abs, y.abs, z.abs].max
end

test1 = ["ne", "ne", "ne"]
test2 = ["ne", "ne", "sw", "sw"]
test3 = ["ne", "ne", "s", "s"]
test4 = ["se", "sw", "se", "sw", "sw"]

[test1, test2, test3, test4].each do |test|
  p test
  pos = [0, 0]
  test.each do |step|
    print "#{pos} : #{step} -> "
    pos = directions[step].call(*pos)
    puts "#{pos}"
  end
  p pos
  p dist(*pos)
  puts "*****"
end

input = File.read("data/11.txt").strip.split(",")
pos = [0, 0]
max = 0

input.each do |step|
  pos = directions[step].call(*pos)
  max = [max, dist(*pos)].max
end

p pos
p dist(*pos)
p max
