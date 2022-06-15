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

  def place_choice(player_location, current_player)
    @board_array[player_location[0]][player_location[1]] = current_player.symbol
  end

  def check_winner
    if check_horizontal_winner(@board_array) == true
      return true
    elsif check_vertical_winner(@board_array) == true
      return true
    elsif check_diagonal_winner(@board_array) ==true
      return true
    else
      false
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
    puts "Player #{self.player_number}, do you want to be \"X\" or \"O\"?"
    @symbol = gets.chomp.upcase
  end

  def player_move
    arr = []
    puts "Player #{@player_number} - What ROW do you want to place your \"#{@symbol}\"?"
    row = gets.chomp.to_i - 1
    puts "Player #{@player_number} - What COLUMN do you want to place your \"#{@symbol}\"?"
    column = gets.chomp.to_i - 1
    arr << row << column
    arr
  end
end

def get_new_move(player, board)
  location = player.player_move
  board.place_choice(location, player)
  board.show_board
end

def check_horizontal_winner(board)
  for i in 0..2
    if board[i].all? {|element| element == "X"} ||
      board[i].all? {|element| element == "O"}
      puts "WINNER!!!"
      return true
    else
      false
    end
  end
end

def check_vertical_winner(board)
  for n in 0..2
    if (board[0][n] == "X" && board[1][n] == "X" && board[2][n] == "X") ||
      (board[0][n] == "O" && board[1][n] == "O" && board[2][n] == "O")
      puts "WINNER!!!"
      return true
    else
      false
    end
  end
end

def check_diagonal_winner(board)
  if (board[0][0] == "X" && board[1][1] == "X" && board[2][2] == "X") ||
    (board[0][0] == "O" && board[1][1] == "O" && board[2][2] == "O")
    puts "WINNER!!!"
    return true
  elsif (board[0][2] == "X" && board[1][1] == "X" && board[2][0] == "X") ||
    (board[0][2] == "O" && board[1][1] == "O" && board[2][0] == "O")
    puts "WINNER!!!"
    return true
  else
    false
  end
end

player1 = Player.new(1)
puts "Player #{player1.player_number} is #{player1.symbol}"
player2 = Player.new(2)
puts "Player #{player2.player_number} is #{player2.symbol}"

board = Board.new

puts "Here's the starting board."
board.show_board

max_moves = 9
winner = false

# play game and allow a maximum of 9 moves total between both players
# or stop game once winner has been declared
until max_moves <= 0 || winner == true
  get_new_move(player1, board)
  max_moves -= 1
  if board.check_winner == true
    winner = true
    next
  end

  if max_moves > 0
    get_new_move(player2, board)
    max_moves -= 1
    if board.check_winner == true
      winner = true
      next
    end
  end
end

puts "Game over"