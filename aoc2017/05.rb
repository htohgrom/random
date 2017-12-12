#!/usr/bin/env ruby -w

input = []
while l = gets
  input << l.strip.to_i
end

# input = [0, 3, 0, 1, -3]

ip = 0
endp = input.length-1
step = 0
loop do
  break if ip > endp
  step += 1
  jmp = input[ip]
#  input[ip] += 1
  input[ip] += input[ip] >= 3 ? -1 : 1
  ip += jmp
end

puts step

# Ok, Ruby IS slow. This will take a while for part 2.
