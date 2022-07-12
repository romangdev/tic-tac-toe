require "player.rb"
require "board.rb"

describe Player do
  subject(:player) { described_class.new(1) }
  let(:board) { instance_double(Board) }

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
end