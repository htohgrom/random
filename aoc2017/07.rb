#!/usr/bin/env ruby -w

class Node
  def initialize(name, weight, children = [])
    @name = name
    @weight = weight
    @children = children
  end
end

input = File.read("data/07.txt").strip.split("\n")

$weights = {}
$children = {}

input.each do |line|
  name, w, *ch = line.scan(/\w+/) # so cool
  $weights[name] = w.to_i
  $children[name] = ch
end

puts "input.length #{input.length}"
puts "weights.length #{$weights.length}"
puts "children.length #{$children.length}"

result = $children.keys - $children.values.flatten
p result

# ---

def wght(x)
  return $weights[x] + $children[x].map {|ch| wght(ch)}.reduce(0) {|s, n| s+= n}
end

puts "root.weight #{wght(result[0])}"
$children[result[0]].each do |ch|
  puts "#{ch}.weight #{wght(ch)}"
end
