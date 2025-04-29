require 'colorize'

class Mastermind
  def initialize
    @hash_colors = {
      yellow: "\u{1F7E1}", # 🟡
      green: "\u{1F7E2}",  # 🟢
      blue: "\u{1F7E3}",   # 🔵
      black: "\u{26AB}",   # ⚫
      red: "\u{1F534}"     # 🔴
    }

    @arr_colors = [
      "\u{1F7E1}", "\u{1F7E2}", "\u{1F7E3}", "\u{26AB}", "\u{1F534}"
    ]
  end

  def initial_screen
    puts
    display_color_bar
    puts "THE MASTERMIND\nC.L.I. GAME"
    display_color_bar
    puts

    puts <<~TEXT
      You have to guess the color and order
      of four colors from a list of 5 colors.
      There are 12 rounds to guess the colors
      and the order of all of them.
    TEXT
    gets.chomp

    puts <<~TEXT
      After each round you will receive feedback
      on whether you got all or part of the colors
      right.
    TEXT
    gets.chomp
  end

  def the_game
    puts 'Enjoy the game!'
    random_list = @arr_colors.sample(4)

    puts 'Choose four colors from these five colors:'
    puts
    print 'yellow, '.colorize(:yellow)
    print 'green, '.colorize(:green)
    print 'blue, '.colorize(:blue)
    print 'black'.colorize(:black) + ', and '
    print 'red'.colorize(:red)
    puts

    rounds = 1
    game = true

    while game
      guess = get_player_guess
      converted_guess = convert_colors(guess)

      puts "\nYou guessed:           #{converted_guess}\n"

      if converted_guess == random_list
        puts 'You win!'
        break
      end

      rounds += 1
      if rounds == 13
        puts 'You lose!'
        break
      end

      give_feedback(converted_guess, random_list)
    end
  end

  private

  def display_color_bar
    @arr_colors.each { |i| print i }
    puts
  end

  def get_player_guess
    guess = []
    4.times do
      puts "\nEnter a color:"
      guess << gets.chomp.downcase
    end
    guess
  end

  def convert_colors(guess)
    guess.map do |color|
      case color
      when 'yellow' then "\u{1F7E1}"
      when 'green'  then "\u{1F7E2}"
      when 'blue'   then "\u{1F7E3}"
      when 'black'  then "\u{26AB}"
      when 'red'    then "\u{1F534}"
      else color
      end
    end
  end

  def give_feedback(guess, random_list)
    puts 'FEEDBACK OF COLORS:'
    guess.each do |item|
      msg = random_list.include?(item) ? 'this color EXISTS in the list' : 'this color DOES NOT EXIST in the list'
      puts "#{item} #{msg}"
    end

    puts ""
    puts "\nFEEDBACK OF POSITION:"
    guess.each_with_index do |item, index|
      msg = random_list[index] == item ? 'is in the right position' : 'is in the wrong position'
      puts "this color: #{item} #{msg}"
    end
  end
end

