require "./lib/game.rb"
require "./lib/player.rb"

describe Game do 
  subject(:game) { described_class.new }
  let(:player1) { instance_double(Player) }
  let(:board) { instance_double(Board) }

  describe "#create_player1" do
    it "Player class receives call for new with 1" do
      expect(Player).to receive(:new).with(1)
      game.create_player1
    end
  end

  describe "#create_player2" do
    it "Player class receives call for new with 2" do
      expect(Player).to receive(:new).with(2)
      game.create_player2(player1)
    end
  end

  # describe "#player1_turn" do 
  #   context "" do 
  #     before do 
  #       allow(game).to receive(:check_winner).with(true)
  #     end
  #   end
  # end
end