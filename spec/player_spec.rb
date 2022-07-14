require "player.rb"
require "board.rb"

describe Player do
  subject(:player) { described_class.new(1) }
  let(:board) { double("board") }
  let(:player1) { double("player1") }
  let(:player2) { double("player2") }

  describe "#get_player1_symbol" do 
    context "when called" do 
      before do 
        allow(player1).to receive(:get_symbol)
        allow(player1).to receive(:player_number)
        allow(player1).to receive(:symbol)
      end
      it "calls get_symbol on player1" do 
        expect(player1).to receive(:get_symbol)
        player.get_player1_symbol(player1)
      end
    end
  end

  # describe "#get_player2_symbol" do 
  #   context "when player1 symbol is 'X'" do 
  #     let(:player1) { double("player1", symbol: "X") }
  #     let(:player2) { double("player2", symbol: nil) }

  #     before do 
  #       allow(player2).to receive(:symbol)
  #     end
  #     it "sets player2 symbol to 'O'" do 
  #       expect(player2).to receive(:symbol).with("O")
  #       player.get_player2_symbol(player1, player2)
  #     end
  #   end
  # end

  describe "#get_symbol" do 
    context "when the player enters \"X\" as their symbol, return symbol" do
      before do 
        allow(player).to receive(:gets).and_return("X")
      end
      it "returns X" do
        expect(player.get_symbol).to eql("X")
      end
    end

    context "when player enters \"O\" as their symbol return symbol" do 
      before do 
        allow(player).to receive(:gets).and_return("O")
      end
      it "returns O" do
        expect(player.get_symbol).to eql("O")
      end
    end
  end

  describe "#fill_player_position" do
    context "When player's chooses a row number and column number" do 
      it "returns an arr of [1, 2]" do
        expect(player.fill_player_position(1, 2)).to eql([1, 2])
      end

      it "returns an arr of [3, 3]" do 
        expect(player.fill_player_position(3, 3)).to eql([3, 3])
      end
    end
  end

  describe "#get_new_move" do 
    context "when called" do 
      before do 
        allow(player).to receive(:player_move)
        allow(board).to receive(:place_choice).with([1, 2], player1)
        allow(board).to receive(:board_array)
        allow(board).to receive(:show_board)
      end
      it "calls #place_choice on the Board class object" do 
        expect(board).to receive(:place_choice)
        player.get_new_move(player, board)
      end
    end
  end
end