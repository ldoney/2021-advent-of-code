grid = []
File.foreach("input") do |line|
  grid.push((line.split("").delete_if do |c| not c =~ /[0-9]/ end).collect do |c| [c.to_i, false] end)
end

lowpoints = []
grid.each_with_index do |row, y|
  row.each_with_index do |v, x|
    nearby = []
    nearby.push(grid[y][x + 1][0]) if grid[y][x + 1]
    nearby.push(grid[y][x - 1][0]) if x - 1 >= 0 && grid[y][x - 1]
    nearby.push(grid[y + 1][x][0]) if grid[y + 1] && grid[y + 1][x]
    nearby.push(grid[y - 1][x][0]) if y - 1 >= 0 && grid[y - 1][x]
    lowpoints.push [v,x,y,[]] if v[0] < nearby.min
  end
end

def search(grid,x,y)
  if grid[y][x] && grid[y][x][0] != 9
    grid[y][x][1] = true
    s0 = (grid[y][x + 1] && (not grid[y][x + 1][1])) ? search(grid, x + 1, y) : [] 
    s1 = (x - 1 >= 0 && grid[y][x - 1] && (not grid[y][x - 1][1])) ? search(grid, x - 1, y) : []
    s2 = (grid[y + 1] && grid[y + 1][x] && (not grid[y + 1][x][1])) ? search(grid, x, y + 1) : [] 
    s3 = (y - 1 >= 0 && grid[y - 1][x] && (not grid[y - 1][x][1])) ? search(grid, x, y - 1) : []
    return ([[grid[y][x][0],x,y]] + s0 + s1 + s2 + s3).uniq
  end
  []
end

basins = []
lowpoints.each do |lowpoint|
  basins.push (search grid, lowpoint[1], lowpoint[2])
  grid.each_with_index do |row, y|
    row.each_with_index do |col, x|
      grid[y][x][1] = false
    end
  end
end

sizes = basins.collect do |v| v.length end
largest = []
for i in 0..2 do
  m = sizes.max
  sizes.delete_at(sizes.index m)
  largest.push m
end
mult = largest.reduce(1) do |a, x| a * x end
puts mult
