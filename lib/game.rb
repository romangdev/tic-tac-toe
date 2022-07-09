#frozen_string_literal: true

require_relative "board"
require_relative "player"

class Game
  def create_player1
    player1 = Player.new(1)
    player1.get_symbol
    puts "\nPlayer #{player1.player_number} is #{player1.symbol}"
    player1
  end

  def create_player2(player1)
    player2 = Player.new(2)
    player2.symbol = if player1.symbol == 'X'
                      'O'
                    else
                      'X'
                    end
    sleep 1
    puts "Player #{player2.player_number} is #{player2.symbol}\n\n"
    player2
  end

  def display_starting_board(board)
    sleep 1
    puts "Here's the starting board."
    board.show_board
    sleep 1
  end

  def player1_turn(player1, board, max_moves, winner)
    winner = false
    player1.get_new_move(player1, board)
    max_moves -= 1
    if board.check_winner == true
      winner = true
    end
    winner
  end

  def player2_turn(player2, board, max_moves, winner)
    winner = false
    player2.get_new_move(player2, board)
    max_moves -= 1
    if board.check_winner == true
      winner = true
    end
    winner
  end

  # play game and allow a maximum of 9 moves total between both players
  # or stop game once winner has been declared
  def run_game(max_moves, winner, game, player1, player2, board)
    until max_moves <= 0 || winner == true
      winner = game.player1_turn(player1, board, max_moves, winner)
      next if winner
    
      next unless max_moves > 0
    
      winner = game.player2_turn(player2, board, max_moves, winner)
    end
    
    sleep 1
    puts 'Game over'
  end
end