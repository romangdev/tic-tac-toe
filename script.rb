class Board
	attr_accessor :board_array

	def initialize 
  	@board_array = Array.new(3) {Array.new(3) {nil}}
  end

  def show_board
    for i in 0..2
      p @board_array[i]
    end
  end

  def place_choice(player_location)
    @board_array[player_location[0]][player_location[1]] = "X"
  end
end	

class Player
  attr_reader :symbol, :player_number

  def initialize(player_number)
    @player_number = player_number
    @symbol = self.get_symbol
  end

  def get_symbol
    puts "Player #{self.player_number}, do you want to be \"X\" or \"O\"?"
    @symbol = gets.chomp.upcase
  end

  def player_move
    arr = []
    puts "What ROW do you want to place your \"#{@symbol}\"?"
    row = gets.chomp.to_i - 1
    puts "What COLUMN do you want to place your \"#{@symbol}\"?"
    column = gets.chomp.to_i - 1
    arr << row << column
    arr
  end
end

player1 = Player.new(1)
puts "Player #{player1.player_number} is #{player1.symbol}"
player2 = Player.new(2)
puts "Player #{player2.player_number} is #{player2.symbol}"

puts "Here's a look at the starting board."
board = Board.new
board.show_board

location = player1.player_move
board.place_choice(location)

board.show_board