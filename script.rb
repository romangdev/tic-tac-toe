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
end	

class Player
  attr_reader :symbol, :player_number

  def initialize(player_number)
    @player_number = player_number
    @symbol = self.get_symbol
  end

  def get_symbol
    puts "Do you want to be \"X\" or \"O\""
    @symbol = gets.chomp.upcase
  end
end

board = Board.new
board.show_board

player1 = Player.new(1)
puts "Player #{player1.player_number} is #{player1.symbol}"