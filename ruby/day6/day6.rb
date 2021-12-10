days = 7
fish = []
File.foreach("input") {|line|
  line.split(",").each_with_index {|v,i|
    n = v.to_i
    fish[i] = n
  }
}

newfish = []
for iteration in 0..(80 - 1) do
  fish.each_with_index {|f, ind| 
    newfish[ind] = f - 1
    if newfish[ind] < 0 then
      newfish[ind] = days - 1
      newfish.push (days + 2)
    end
  }
  fish = newfish
end

puts fish.length()
