require_relative "../tic_tac_toe"

describe Game do
  let(:p1) { instance_double(Player) }
  let(:p2) { instance_double(Player) }

  before do
    allow(p1).to receive(:winner?)
    allow(p1).to receive(:make_move)
    allow(p2).to receive(:winner?)
    allow(p2).to receive(:make_move)
    allow(Game).to receive(:display_board)
  end
  
  describe "#play_game" do
    it 'sends message to #make_move to p1' do
      expect(p1).to receive(:make_move)
      Game.new(p1, p2)
    end
    
    it 'sends message to #make_move to p2' do
      expect(p2).to receive(:make_move)
      Game.new(p1, p2)
    end

    context "when there's a winner" do
      before do
        allow(p1).to receive(:winner?).and_return(true)
        allow(p1).to receive(:name).and_return("Momata")
        allow(Game).to receive(:puts)
      end
      it "out puts the winner message" do
        expect{ Game.new(p1, p2) }.to output("Momata Wins!\n").to_stdout
      end
    end

    context "when it is a draw" do
      before do
        allow(p1).to receive(:winner?).and_return(false)
        allow(p2).to receive(:winner?).and_return(false)
      end

      it "outputs the draw message" do
        expect { Game.new(p1, p2) }.to output("It is a Draw\n").to_stdout
      end
    end
  end
end