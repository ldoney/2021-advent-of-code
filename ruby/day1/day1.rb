last = nil
increased_amount = 0
File.foreach("input") { |line|
  if last != nil then
    if line.to_i > last then
      increased_amount = increased_amount + 1
    end
  end
  last = line.to_i
}

puts increased_amount
