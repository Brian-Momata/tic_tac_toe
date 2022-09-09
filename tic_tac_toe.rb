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
