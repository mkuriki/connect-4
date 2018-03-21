require "spec_helper"

describe Player do
  let(:player_x) { Player.new('one', 'x') }

  describe "#initialize" do
    it "has a name 'one' and coin 'x'" do
      expect(player_x.name).to eq 'one'
      expect(player_x.coin).to eq 'x'
    end
  end
end
