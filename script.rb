# Class for Tic Tac Toe board to show the board, place player choices, 
# and check for winners.
class Board
	attr_accessor :board_array

	def initialize(player1, player2)
  	@board_array = Array.new(3) {Array.new(3) {nil}}
    @player1 = player1
    @player2 = player2
  end

  def show_board
    puts "\n"
    for i in 0..2
      p @board_array[i]
    end
    puts "\n"
  end

  def place_choice(player_location, current_player)
    @board_array[player_location[0]][player_location[1]] = current_player.symbol
  end

  def check_winner
    if check_horizontal_winner(@board_array, @player1, @player2) == true
      return true
    elsif check_vertical_winner(@board_array, @player1, @player2) == true
      return true
    elsif check_diagonal_winner(@board_array, @player1, @player2) ==true
      return true
    else
      false
    end
  end
end	

# Class for tic tac toe players to get their order, chosen symbol, 
# and their move location choice
class Player
  attr_reader :player_number
  attr_accessor :symbol

  def initialize(player_number)
    @player_number = player_number
    @symbol = nil
  end

  def get_symbol
    begin
      puts "Player #{self.player_number}, do you want to be \"X\" or \"O\"?"
      @symbol = gets.chomp.upcase
      if @symbol != "X" && @symbol != "O"
        raise "ERROR: Incorrect input"
      end
    rescue => exception
      puts "Incorrect input. Please try again with \"X\" or \"O\""
      sleep 1
      retry
    else
      @symbol
    end
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

def check_horizontal_winner(board, p1, p2)
  for i in 0..2
    if board[i].all? {|element| element == "X"} ||
      board[i].all? {|element| element == "O"}
      if (board[i][0] == "X" && p1.symbol == "X") ||
        (board[i][0] == "O" && p1.symbol == "O")
        puts "PLAYER #{p1.player_number} WINS!!!"
        return true
      else
        puts "PLAYER #{p2.player_number} WINS!!!"
        return true
      end
    else
      false
    end
  end
end

def check_vertical_winner(board, p1, p2)
  for n in 0..2
    if (board[0][n] == "X" && board[1][n] == "X" && board[2][n] == "X") ||
      (board[0][n] == "O" && board[1][n] == "O" && board[2][n] == "O")
      if (board[0][n] == "X" && p1.symbol == "X") ||
        (board[0][n] == "O" && p1.symbol == "O")
        puts "PLAYER #{p1.player_number} WINS!!!"
        return true
      else
        puts "PLAYER #{p2.player_number} WINS!!!"
        return true
      end
    else
      false
    end
  end
end

def check_diagonal_winner(board, p1, p2)
  if (board[0][0] == "X" && board[1][1] == "X" && board[2][2] == "X") ||
    (board[0][0] == "O" && board[1][1] == "O" && board[2][2] == "O")
    if (board[0][0] == "X" && p1.symbol == "X") ||
      (board[0][0] == "O" && p1.symbol == "O")
      puts "PLAYER #{p1.player_number} WINS!!!"
      return true
    else
      puts "PLAYER #{p2.player_number} WINS!!!"
      return true
    end
  elsif (board[0][2] == "X" && board[1][1] == "X" && board[2][0] == "X") ||
    (board[0][2] == "O" && board[1][1] == "O" && board[2][0] == "O")
    if (board[0][2] == "X" && p1.symbol == "X") ||
      (board[0][2] == "O" && p1.symbol == "O")
      puts "PLAYER #{p1.player_number} WINS!!!"
      return true
    else
      puts "PLAYER #{p2.player_number} WINS!!!"
      return true
    end
  else
    false
  end
end

# Create the 2 players
player1 = Player.new(1)
player1.get_symbol
puts "\nPlayer #{player1.player_number} is #{player1.symbol}"

player2 = Player.new(2)
if player1.symbol == "X"
  player2.symbol = "O"
else
  player2.symbol = "X"
end
sleep 1
puts "Player #{player2.player_number} is #{player2.symbol}\n\n"

board = Board.new(player1, player2)
sleep 1
puts "Here's the starting board."
board.show_board
sleep 1

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

sleep 1
puts "Game over"