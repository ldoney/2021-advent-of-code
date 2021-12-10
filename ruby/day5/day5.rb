def max (a,b)
  a>b ? a : b
end
def min (a,b)
  a>b ? b : a
end
selections = []
File.foreach("input") {|line|
  line =~ /(\d+),(\d+) -> (\d+),(\d+)/
  x1 = $1.to_i
  y1 = $2.to_i
  x2 = $3.to_i
  y2 = $4.to_i
  if x1 != x2 && y1 == y2 then
    for x in min(x1,x2)..max(x1,x2) do
      selections[y1] = [] unless selections[y1]
      selections[y1][x] ? selections[y1][x] += 1 : selections[y1][x] = 1
    end
  elsif y1 != y2 && x1 == x2 then 
    for y in min(y1,y2)..max(y1,y2) do
      selections[y] = [] unless selections[y]
      selections[y][x1] ? selections[y][x1] += 1 : selections[y][x1] = 1
    end
  end
}

count = 0
for y in selections
  for n in y 
    count += 1 if n ? n > 1 : false
  end if y
end
puts count
