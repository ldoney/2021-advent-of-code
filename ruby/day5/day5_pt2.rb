def max (a,b)
  a>b ? a : b
end
def min (a,b)
  a>b ? b : a
end
selections = []
File.foreach("input") {|line|
  puts line
  line =~ /(\d+),(\d+) -> (\d+),(\d+)/
  x1 = $1.to_i
  y1 = $2.to_i
  x2 = $3.to_i
  y2 = $4.to_i
  if x1 != x2 && y1 == y2 then
    puts "Horizontal"
    for x in min(x1,x2)..max(x1,x2) do
      selections[y1] = [] unless selections[y1]
      selections[y1][x] ? selections[y1][x] += 1 : selections[y1][x] = 1
    end
  elsif y1 != y2 && x1 == x2 then 
    puts "Vertical"
    for y in min(y1,y2)..max(y1,y2) do
      selections[y] = [] unless selections[y]
      selections[y][x1] ? selections[y][x1] += 1 : selections[y][x1] = 1
    end
  else 
    xmult = 1
    ymult = 1
    xmult = -1 if x2 - x1 < 0
    ymult = -1 if y2 - y1 > 0
    for i in 0..(y2 - y1).abs do
      xind = x1 + (i*xmult)
      yind = y1 - (i*ymult)
      selections[yind] = [] unless selections[yind]
      selections[yind][xind] ? selections[yind][xind] += 1 : selections[yind][xind] = 1
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
