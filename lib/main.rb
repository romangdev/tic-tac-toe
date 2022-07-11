#frozen_string_literal: true

require_relative "board"
require_relative "player"
require_relative "game"


game = Game.new
player1 = game.create_player1
player1.get_player1_symbol(player1)
player2 = game.create_player2(player1)
player2.get_player2_symbol(player1, player2)
board = Board.new(player1, player2)
game.display_starting_board(board)
max_moves = 9
winner = false
game.run_game(max_moves, winner, game, player1, player2, board)