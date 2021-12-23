closing = /\]|\)|\}|\>/
opening = /\(|\[\{\</
def get_reverse(ch)
  "(" if ch == ")"
  ")" if ch == "("
  "[" if ch == "]"
  "]" if ch == "["
  "{" if ch == "}"
  "}" if ch == "{"
  "<" if ch == ">"
  ">" if ch == "<"
end

File.foreach("input2") do |line|
  stack = []
  (line.split("").delete_if do |x| x == "\n" end).each do |c|
    puts "#{stack}"
    if c =~ opening then
      stack.push c
    elsif c =~ closing then
      last_index = stack.map {|x| x == (get_reverse c)}.rindex(true)
      if last_index && stack[last_index] then
        stack.delete_at last_index
      else
        puts "#{stack}"
        puts "Corrupted!"
        return 
      end
    end
  end
  if stack.empty? then
    puts "Good line: #{line}"
  else
    puts "Bad line: #{line}"
  end
end
