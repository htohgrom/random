#!/usr/bin/env ruby -w
# #
# # 361527

# input = ARGV[0].to_i

# sqr = Math.sqrt(input).ceil
# if sqr.even? then sqr +=1 end

# max_dist = sqr-1
# min_dist = max_dist/2
# side_len = sqr

# points = []
# (0..3).each {|x| points << sqr**2-x*(side_len-1)}

# puts "input:           #{input}"
# puts "next odd square: #{sqr}"
# puts "max distance:    #{max_dist}"
# puts "min distance:    #{min_dist}"
# puts "side length:     #{side_len}"
# p points

# #--------------------------------------------------------------------------------

directions = {
  :right => {:next_cell => lambda {|x, y| [x+1, y]}, :next_dir => :up},
  :up    => {:next_cell => lambda {|x, y| [x, y+1]}, :next_dir => :left},
  :left  => {:next_cell => lambda {|x, y| [x-1, y]}, :next_dir => :down},
  :down  => {:next_cell => lambda {|x, y| [x, y-1]}, :next_dir => :right}
}

def nb(x, y)
  [
    [x-1, y+1], [x, y+1], [x+1, y+1],
    [x-1, y  ],           [x+1, y  ],
    [x-1, y-1], [x, y-1], [x+1, y-1]
  ]
end

grid = Hash.new(0)
grid[[0, 0]] = 1
dir = :right
x = y = 0

for step in (1..10)
  2.times do |i|
    step.times do |s|
      x, y = directions[dir][:next_cell].call(x, y)
      grid[[x, y]] = nb(x, y).map {|p| grid[p]}.reduce(&:+)
      puts "goin' #{step} steps #{dir.to_s}, (x, y)=(#{x}, #{y}), value=#{grid[[x, y]]}"
    end
    dir = directions[dir][:next_dir]
  end
end
