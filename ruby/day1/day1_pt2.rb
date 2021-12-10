def sum (tup)
  if tup[0] != nil && tup[1] != nil && tup[2] != nil then
    tup[0] + tup[1] + tup[2]
  else
    0
  end
end

tups = []
index = 0
size = 2 
File.foreach("input") { |line|
  for x in 0..size do
    if (index - x) >= 0 then
      if tups[index - x] then
        tups[index - x].push line.to_i
      else 
        tups[index - x] = [line.to_i] if not tups[index - x]
      end
    end
  end
  index += 1
}

increased_amount = 0
tups.each_with_index {|val,index|
  if val.length() < 3 then
    next
  end
  if index > 0 
    if sum(val) > sum(tups[index - 1]) 
      increased_amount = increased_amount + 1 
    end
  end
}

puts increased_amount
