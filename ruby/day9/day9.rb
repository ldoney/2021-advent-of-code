grid = []
File.foreach("input") do |line|
  grid.push((line.split("").delete_if do |c| not c =~ /[0-9]/ end).collect do |c| c.to_i end)
end

lowpoints = []
grid.each_with_index do |row, y|
  row.each_with_index do |v, x|
    nearby = []
    nearby.push(grid[y][x + 1]) if grid[y][x + 1]
    nearby.push(grid[y][x - 1]) if x - 1 >= 0 && grid[y][x - 1]
    nearby.push(grid[y + 1][x]) if grid[y + 1] && grid[y + 1][x]
    nearby.push(grid[y - 1][x]) if y - 1 >= 0 && grid[y - 1][x]
    lowpoints.push [v,x,y] if v < nearby.min
  end
end

sum = lowpoints.reduce(0) do |a, x| a + (x[0] + 1) end
puts sum
