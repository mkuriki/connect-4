require "spec_helper"

describe Game do
  let(:player_x) { Player.new('one', 'x') }
  let(:player_o) { Player.new('two', 'o') }
  let(:game) { Game.new(player_x, player_o) }

  describe "#initialize" do
    it "sets player_x as a current player" do
      expect(game.current_player).to eq(player_x)
    end
  end

  describe "#next_turn" do
    it "changes the current player to player_o" do
      game.next_turn
      expect(game.current_player).to eq(player_o)
    end
  end
end
