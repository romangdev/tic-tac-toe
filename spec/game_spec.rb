require "./lib/game.rb"
require "./lib/player.rb"
require "./lib/board.rb"

describe Game do 
  subject(:game) { described_class.new }
  let(:player1) { instance_double(Player) }
  let(:player2) {instance_double(Player) }
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

  describe "#player1_turn" do 
    before do 
      allow(player1).to receive(:get_new_move).with(player1, board)
    end
    it "sends check_winner to Board class object" do 
      expect(board).to receive(:check_winner)
      game.player1_turn(player1, board, 5, false)
    end

    before do 
      allow(board).to receive(:check_winner)
    end
    it "sends get_new_move to Player class object" do 
      expect(player1).to receive(:get_new_move)
      game.player1_turn(player1, board, 5, false)
    end

    context "when #check_winner from Board object returns true" do 
      before do 
        allow(board).to receive(:check_winner).and_return(true)
        allow(player1).to receive(:get_new_move).with(player1, board)
      end
      it "returns winner as true" do
        expect(game.player1_turn(player1, board, 5, true)).to eql(true)
      end
    end

    context "when #check_winner from Board object returns false" do 
      before do 
        allow(board).to receive(:check_winner).and_return(false)
        allow(player1).to receive(:get_new_move).with(player1, board)
      end
      it "returns winner as true" do
        expect(game.player1_turn(player1, board, 5, true)).to eql(false)
      end
    end
  end

  describe "#player2_turn" do 
    before do 
      allow(player2).to receive(:get_new_move).with(player2, board)
    end
    it "sends check_winner to Board class object" do 
      expect(board).to receive(:check_winner)
      game.player2_turn(player2, board, 5, false)
    end

    before do 
      allow(board).to receive(:check_winner)
    end
    it "sends get_new_move to Player class object" do 
      expect(player2).to receive(:get_new_move)
      game.player2_turn(player2, board, 5, false)
    end

    context "when #check_winner from Board object returns true" do 
      before do 
        allow(board).to receive(:check_winner).and_return(true)
        allow(player2).to receive(:get_new_move).with(player2, board)
      end
      it "returns winner as true" do
        expect(game.player2_turn(player2, board, 5, true)).to eql(true)
      end
    end

    context "when #check_winner from Board object returns false" do 
      before do 
        allow(board).to receive(:check_winner).and_return(false)
        allow(player2).to receive(:get_new_move).with(player2, board)
      end
      it "returns winner as true" do
        expect(game.player2_turn(player2, board, 5, true)).to eql(false)
      end
    end
  end

  describe "#display_starting_board" do 
    it "calls show_board on the Board class object" do 
      expect(board).to receive(:show_board)
      game.display_starting_board(board)
    end
  end
end