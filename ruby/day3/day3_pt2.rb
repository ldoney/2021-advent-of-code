counts_0 = Array.new(12) {|i| 0}
counts_1 = Array.new(12) {|i| 0}
File.foreach("input") {|line|
  line =~ /(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)/
  for i in 0..12
    if Regexp.last_match(i) == "1" then
      counts_1[i-1] += 1 
    elsif Regexp.last_match(i) == "0" then
      counts_0[i-1] += 1
    end
  end
}
arr = Array.new(12) {|i| counts_1[i] > counts_0[i] ? 1 : 0}

gamma = 0
epsilon = 0
arr.reverse().each_with_index {|val, index|
  gamma += val*(2**index)
  epsilon += (val == 0 ? 1 : 0)*(2**index)
}
puts "#{gamma}"
puts "#{epsilon}"
puts "Consumption: #{gamma*epsilon}"
