subs = []
File.foreach("input").first.split(",").each {|val|
  subs.push val.to_i
}

subs = subs.sort
len = subs.length()
median = (subs[(len - 1)/2] + subs[len / 2])/2

tot = 0
subs.each {|v| 
  tot += (v - median).abs
}
puts tot
