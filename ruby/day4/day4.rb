list = []
first = true
boards = []

class Board 
  def initialize()
    @vals = []
  end

  def add_row(cols)
    col = []
    for c in cols do
      col.push [c, false]
    end
    @vals[@vals.length] = col
  end
  
  def tick(n)
    @vals.each_with_index {|row,i|
      row.each_with_index {|col,j|
        if col[0] == n then
          @vals[i][j] = [n, true]
        end
      }
    }
  end

  def check()
    (check_generic @vals) or (check_generic @vals.transpose)
  end

  def check_generic(arr)
    arr.each {|row|
      return false if row == []
      row_flag = true
      row.each {|col|
        row_flag = row_flag && col[1] 
      }
      return row_flag
    }
    return false
  end

  def compute_score()
    score = 0
    @vals.each {|row|
      row.each {|col|
        if col[1] == false then
          score += col[0]
        end
      }
    }
    score
  end
end

cur_board = Board.new

File.foreach("input") {|line|
  if first then
    index = 0
    for num in line.split(",") do
      list[index] = num.to_i
      index += 1
    end
    first = false
  else
    if line == "\n" then
      boards.push cur_board
      cur_board = Board.new
    else
      new_row = []
      index = 0
      for num in line.split(" ") do
        new_row[index] = num.to_i
        index += 1
      end
      cur_board.add_row new_row
    end
  end
}

for drawing in list do
  for board in boards do
    board.tick drawing
    if board.check then
      puts "We found a winner! Score: #{board.compute_score * drawing}"
      exit
    end
  end
end
