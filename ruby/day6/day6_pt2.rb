days = 8
fish = Array.new(days + 1) {|i| 0}
File.foreach("input") {|line|
  line.split(",").each_with_index {|v,i|
    n = v.to_i
    fish[n] = fish[n] + 1
  }
}

puts "Initial: #{fish}"
newfish = fish
for iteration in 0..(256 - 1) do
  initial = newfish[0]

  # Add this to the end
  fish.each_with_index {|fishy_count, day|
    if day != 0 then
      newfish[day - 1] = fishy_count 
    end
  }
  newfish[6] += initial
  newfish[8] = initial
  fish = newfish
  puts "After #{iteration + 1} days: #{fish}"
end

sum = 0
fish.each {|x|
  sum += x
}
puts sum
