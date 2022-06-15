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
    def initialize(name)
        @name = name
        @symbol 
    end

    def get_symbol
        puts "Do you want to be \"X\" or \"O\""
        @symbol = gets.chomp.upcase
    end
end

board = Board.new
board.show_board