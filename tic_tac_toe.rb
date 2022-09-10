class Game
  @@board = (1..9).to_a

  def initialize p1, p2
    play_game p1, p2
  end

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

  private

  def play_game p1, p2
    p1_turn = true
    Game.display_board
    9.times do 
      if p1_turn
        p1.make_move
        p1_turn = false
        Game.display_board
      else
        p2.make_move
        p1_turn = true
        Game.display_board
      end
    end
  end
end

class Player < Game
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

  def make_move 
    puts "#{self.name} choose an available slot from the board to place your mark"
    slot = gets.chomp.to_i
    @@board.each_index do |i|
      if @@board[i] == slot
        @@board[i] = self.mark
      end
    end
  end

  def is_winner?
    winning_combos = [[0, 4, 8],
                     [0, 1, 2], 
                     [0, 3, 6],
                     [1, 4, 7], 
                     [2, 5, 8],
                     [2, 4, 6],
                     [3, 4, 5],
                     [6, 7, 8]
                    ]
    winning_combos.any? do |combo|
      combo.all? { |i| @@board[i] == self.mark}
    end
  end
end

p1 = Player.new
p2 = Player.new

Game.new(p1, p2)