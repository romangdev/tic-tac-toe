#frozen_string_literal: true

require_relative "board"

# Class for tic tac toe players to get their order, chosen symbol,
# and their move location choice
class Player
  attr_reader :player_number
  attr_accessor :symbol

  def initialize(player_number)
    @player_number = player_number
    @symbol = nil
  end

  # get the symbol player 1 wants to play with
  def get_symbol
    puts "Player #{player_number}, do you want to be \"X\" or \"O\"?"
    @symbol = gets.chomp.upcase
    raise 'ERROR: Incorrect input' if @symbol != 'X' && @symbol != 'O'
  rescue StandardError 
    puts 'Incorrect input. Please try again with "X" or "O"'
    sleep 1
    retry
  else
    @symbol
  end

  # fill the player's position on the board with their symbol
  def fill_player_position(row, column)
    puts "An #{@symbol} in position R#{row + 1}, C#{column + 1}"
    arr = []
    arr << row << column
    arr
  end

  # Find out from player where they want to place their symbol on the board
  # Handle positions chosen outside of board contraints, are alraedy chosen positions
  def player_move(board)
    begin
      row = get_player_row
      column = get_player_column
      check_location_validity(board, row, column)
    rescue StandardError
      puts "\nWAIT! That location is already filled. Please try again!\n\n"
      sleep 1
      retry
    else
      fill_player_position(row, column)
    end
  end

  # get the player's desired placement location and put it on the board
  def get_new_move(player, board)
    location = player.player_move(board.board_array)
    board.place_choice(location, player)
    board.show_board
  end

  private 

  # raise error to be rescued if player chooses position already chosen previously
  def check_location_validity(board, row, column)
    if !board[row][column].nil?
      raise 'ERROR: Location already filled'
    else
      board[row][column]
    end
  end

  # get column position from player
  def get_player_column
    begin
      puts "Player #{@player_number} - What COLUMN do you want to place your \"#{@symbol}\"?"
      column = gets.chomp.to_i - 1
      raise 'ERROR: Incorrect input' unless column.between?(0, 2)
    rescue StandardError
      puts "\nIncorrect input. Please try again!"
      retry
    else
      puts "\nGot it!\n"
      sleep 1
      column
    end
  end

  # get row position from player
  def get_player_row
    begin
      puts "Player #{@player_number} - What ROW do you want to place your \"#{@symbol}\"?"
      row = gets.chomp.to_i - 1
      raise 'ERROR: Incorrect input' unless row.between?(0, 2)
    rescue StandardError
      puts "\nIncorrect input. Please try again!"
      retry
    else
      puts "\nGot it!"
      row
    end
  end
end