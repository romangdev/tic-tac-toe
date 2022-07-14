# frozen_string_literal: true

require"board.rb"

describe Board do

  subject(:board) { described_class.new(player1, player2) }
  let(:player1) { double(Player, symbol: "X") }
  let(:player2) { double(Player) }

  describe "#check_winner" do

    context "when checking for 3 in a row horizontally returns true" do
      before do 
        allow(board).to receive(:check_horizontal_winner).and_return(true)
      end

      it "returns true" do 
        expect(board.check_winner).to eql(true)
        board.check_winner
      end
    end

    context "when checking for 3 in a row vertically returns true" do
      before do 
        allow(board).to receive(:check_vertical_winner).and_return(true)
      end

      it "returns true" do
        expect(board.check_winner).to eql(true)
        board.check_winner
      end
    end

    context "when checking for 3 in a row diagonally returns true" do
      before do 
        allow(board).to receive(:check_diagonal_winner).and_return(true)
      end

      it "returns true" do 
        expect(board.check_winner).to eql(true)
      end
    end

    context "when checking all functions checking for direction winner return false" do
      before do 
        allow(board).to receive(:check_horizontal_winner).and_return(false)
        allow(board).to receive(:check_vertical_winner).and_return(false)
        allow(board).to receive(:check_diagonal_winner).and_return(false)
      end

      it "returns false" do
        expect(board.check_winner).to eql(false)
        board.check_winner
      end
    end
  end

  describe "#place_choice" do 
    let(:current_player) { double("current_player", symbol: "X") }

    context "when given a player_location and symbol 'X'" do 
      it "places \"X\" in [1. 2] and returns array" do 
        expect { board.place_choice([1, 2], current_player) }.to change { board.board_array[1][2] }.from(nil).to("X")
      end

      it "places \"X\" in [2, 0] and returns array" do 
        expect { board.place_choice([2, 0], current_player) }.to change { board.board_array[2][0] }.from(nil).to("X")
      end
    end

    context "when given player_location and symbol 'Y'" do 
      it "places \"Y\" in [0. 0] and returns array" do 
        expect { board.place_choice([0, 0], current_player) }.to change { board.board_array[0][0] }.from(nil).to("X")
      end

      it "places \"Y\" in [1, 1] and returns array" do 
        expect { board.place_choice([1, 1], current_player) }.to change { board.board_array[1][1] }.from(nil).to("X")
      end
    end
  end
end