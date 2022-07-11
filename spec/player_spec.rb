require "player.rb"

describe Player do
  subject(:player) { described_class.new(1) }

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

    # make sub method out of lines that raise error and assign it
    # check to ensure people are reprompted to enter for this one?
    # context "when player enters non-X or non-O as their symbol, raise an error" do
    #   before do 
    #     allow(player).to receive(:gets).and_return(56)
    #   end
    #   error_msg = 'Incorrect input. Please try again with "X" or "O"'
    #   it "raises an error" do
    #     # expect(player).to receive(:puts).with("Player 1, do you want to be \"X\" or \"O\"?")
    #     expect(player).to receive(:puts).and_return('Incorrect input. Please try again with "X" or "O"')
    #     player.get_symbol
    #   end

      # before do 
      #   allow(player).to receive(:gets).and_return("kjaKD  j")
      # end
    # end
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