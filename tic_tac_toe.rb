class Player
  attr_accessor :name, :mark

  @@players = {}

  def initialize
    if @@players.empty?
      puts 'Player 1: What is your name?'
      self.name = gets.chomp
      puts 'Choose a mark (X or O)'
      self.mark = gets.chomp
      @@players[self.name] = self.mark
    else
      puts 'Player 2: What is your name?'
      self.name = gets.chomp
      puts "Choose a mark (X or O) Player 1 has already chosen #{@@players.values[0]}"
      self.mark = gets.chomp
      @@players[self.name] = self.mark
    end
  end
end

class Game
  @@board = (1..9).to_a

  def Game.display_board
    row1 = "#{@@board[0]} | #{@@board[1]} | #{@@board[2]}"
    row2 = "#{@@board[3]} | #{@@board[4]} | #{@@board[5]}"
    row3 = "#{@@board[6]} | #{@@board[7]} | #{@@board[8]}"
    separator = '---------'
    puts row1
    puts separator
    puts row2
    puts separator
    puts row3
  end
end