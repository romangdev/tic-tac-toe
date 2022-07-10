#frozen_string_literal: false

require_relative "player"

# Class for Tic Tac Toe board to show the board, place player choices,
# and check for winners.
class Board
  attr_accessor :board_array

  def initialize(player1, player2)
    @board_array = Array.new(3) { Array.new(3) { nil } }
    @player1 = player1
    @player2 = player2
  end

  # display the current state of the board
  def show_board
    puts "\n"
    for i in 0..2
      p @board_array[i]
    end
    puts "\n"
  end

  # fill the player's choice position with their symbol
  def place_choice(player_location, current_player)
    @board_array[player_location[0]][player_location[1]] = current_player.symbol
  end

  # check if someone won the game
  def check_winner
    if check_horizontal_winner == true
      true
    elsif check_vertical_winner(@board_array, @player1, @player2) == true
      true
    else
      check_diagonal_winner(@board_array, @player1, @player2) == true
    end
  end

  private

  def check_horizontal_winner
    for i in 0..2
      if @board_array[i].all? { |element| element == 'X' } ||
         @board_array[i].all? { |element| element == 'O' }
        if (@board_array[i][0] == 'X' && @player1.symbol == 'X') ||
           (@board_array[i][0] == 'O' && @player1.symbol == 'O')
          puts "PLAYER #{@player1.player_number} WINS!!!"
          return true
        else
          puts "PLAYER #{@player2.player_number} WINS!!!"
          return true
        end
      else
        false
      end
    end
  end
  
  def check_vertical_winner(board, p1, p2)
    for n in 0..2
      if (board[0][n] == 'X' && board[1][n] == 'X' && board[2][n] == 'X') ||
         (board[0][n] == 'O' && board[1][n] == 'O' && board[2][n] == 'O')
        if (board[0][n] == 'X' && p1.symbol == 'X') ||
           (board[0][n] == 'O' && p1.symbol == 'O')
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
    if (board[0][0] == 'X' && board[1][1] == 'X' && board[2][2] == 'X') ||
       (board[0][0] == 'O' && board[1][1] == 'O' && board[2][2] == 'O')
      if (board[0][0] == 'X' && p1.symbol == 'X') ||
         (board[0][0] == 'O' && p1.symbol == 'O')
        puts "PLAYER #{p1.player_number} WINS!!!"
        true
      else
        puts "PLAYER #{p2.player_number} WINS!!!"
        true
      end
    elsif (board[0][2] == 'X' && board[1][1] == 'X' && board[2][0] == 'X') ||
          (board[0][2] == 'O' && board[1][1] == 'O' && board[2][0] == 'O')
      if (board[0][2] == 'X' && p1.symbol == 'X') ||
         (board[0][2] == 'O' && p1.symbol == 'O')
        puts "PLAYER #{p1.player_number} WINS!!!"
        true
      else
        puts "PLAYER #{p2.player_number} WINS!!!"
        true
      end
    else
      false
    end
  end
end
