def sum(n)
  return 0 if n == 0
  n + sum(n - 1)
end

subs = []
File.foreach("input").first.split(",").each {|val|
  subs.push val.to_i
}

fuelslist = []
for x in 0..(subs.max) do
  puts x
  tot = 0
  subs.each {|v| 
    tot += sum ((v - x).abs)
  }
  fuelslist[x] = tot
end

puts fuelslist.min
