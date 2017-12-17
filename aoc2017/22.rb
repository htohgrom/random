#!/usr/bin/env ruby -w

input = File.read("data/22.txt").strip.split

w = input[0].length
h = input.length
dx = w/2
dy = h/2
puts "w = #{w} dx = #{dx}"
puts "h = #{h} dy = #{dy}"

grid = {}

input.each_with_index do |row, i|
  row.chars.each_with_index do |elem, j|
    grid[[i-dx, j-dy]] = elem == "." ? :clean : :infected
  end
end

direction = {
  :infected => lambda {|x, y| }
}
