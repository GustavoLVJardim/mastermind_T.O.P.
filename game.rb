require 'colorize'

hash_colors = {
  yellow: "\u{1F7E1}", # 🟡
  green: "\u{1F7E2}",  # 🟢
  blue: "\u{1F7E3}",   # 🔵
  black: "\u{26AB}",   # ⚫
  red: "\u{1F534}",    # 🔴
}

arr_colors = ["\u{1F7E1}", "\u{1F7E2}", "\u{1F7E3}", "\u{26AB}", "\u{1F534}"]

puts ""
arr_colors.each do |i|
  print i  
end
puts ''
puts "THE MASTERMIND
C.L.I. GAME"

arr_colors.each do |i|
  print i  
end
puts ""

puts ""


puts "You have to guess the color and order
of four colors from a list of 5 colors.
There are 12 rounds to guess the colors
and the order of all of them."
gets.chomp

puts "After each round you will receive feedback
on whether you got all or part of the colors
right."
gets.chomp

puts "Enjoy the game!"
random_list = arr_colors.sample(4)
#print random_list

puts "choose four cores
from these five colors:"
puts ""

print 'yellow, '.colorize(:yellow)
print 'green, '.colorize(:green)
print 'blue, '.colorize(:blue)
print 'black'.colorize(:black), ' and '
print 'red'.colorize(:red)
puts ""

rounds = 1
game = true

while game
  guess = []
  4.times do
    puts ""
    puts "Enter a color:"
    guess << gets.chomp.downcase
  end

  guess.each do |i|
    if i == "yellow"
      guess[guess.index(i)] = "\u{1F7E1}"
    elsif i == "green"
      guess[guess.index(i)] = "\u{1F7E2}"
    elsif i == "blue"
      guess[guess.index(i)] = "\u{1F7E3}"
    elsif i == "black"
      guess[guess.index(i)] = "\u{26AB}"
    elsif i == "red"
      guess[guess.index(i)] = "\u{1F534}"
    end
  end



  puts ""
  puts ""

  puts "You guessed:           #{guess}"
  #puts "random list of colors: #{random_list}"
  puts ""
  puts ""

  if guess == random_list
    puts "You win!"
    game = false
    break
  else
    rounds += 1
  end

  if rounds == 13
    puts "You lose!"
    game = false
    break
  end

  puts "FEEDBACK OF COLORS:"
  guess.each do |item|
    if random_list.include?(item)
      puts "#{item} this color EXISTS in the list"
    else
      puts "#{item} this color DOES NOT EXIST in the list"
    end
  end

  puts ""
  puts "FEEDBACK OS POSITION:"
  guess.each_with_index do |item, index|
    if random_list[index] == item
      puts "this color: #{item} is in the right position"
    else
      puts "this color: #{item} is in the wrong position"
    end
  end
end

