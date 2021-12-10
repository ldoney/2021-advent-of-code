pos_x = 0
depth = 0
File.foreach("input") { |line|
  if line =~ /forward (\d+)/ then
    pos_x += $1.to_i()
  elsif line =~ /up (\d+)/ then
    depth -= $1.to_i()
  elsif line =~ /down (\d+)/ then
    depth += $1.to_i()
  end
}

puts "Horizontal: #{pos_x}"
puts "Depth: #{depth}"
puts "Answer: #{pos_x*depth}"
