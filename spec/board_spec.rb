#frozen_string_literal: true

require"board.rb"

describe Board do

  subject(:board) { described_class.new(player1, player2) }
  let(:player1) { double(Player) }
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
end