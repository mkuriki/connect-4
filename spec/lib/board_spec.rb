require "spec_helper"

describe Board do
  let(:board) { Board.new }
  let(:array_empty) { [
    [' ',' ',' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ',' ',' ']
  ] }
  let(:array_col_not_available) { [
    ['o',' ',' ',' ',' ',' ',' '],
    ['x',' ',' ',' ',' ',' ',' '],
    ['o',' ',' ',' ',' ',' ',' '],
    ['x',' ',' ',' ',' ',' ',' '],
    ['o',' ',' ',' ',' ',' ',' '],
    ['x',' ',' ',' ',' ',' ',' ']
  ] }
  let(:array_draw) { [
    ['o','x','o','o','o','x',' '],
    ['x','o','x','x','x','o','x'],
    ['o','x','x','x','o','x','o'],
    ['x','o','o','x','o','o','x'],
    ['o','o','x','o','x','x','o'],
    ['x','o','x','o','x','o','x']
  ] }
  let(:array_horizontal) { [
    ['o',' ','o','o','o','x','x'],
    ['x','o','x','x','x','o','x'],
    ['o','x','x','x','o','x','o'],
    ['x','o','o','x','o','o','x'],
    ['o','o','x','o','x','x','o'],
    ['x','o','x','o','x','o','x']
  ] }
  let(:array_vertical) { [
    [' ',' ',' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ',' ',' '],
    ['x','o','o','o','o','x','x'],
    ['x','o','o','o','x','x','o'],
    ['x','o','x','o','x','o','x']
  ] }
  let(:array_diagonal_one) { [
    [' ',' ',' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ',' ',' '],
    ['x','o','o','o','o','x','x'],
    ['x','o','o','o','x','x','o'],
    ['x','o','x','o','x','o','x']
  ] }
  let(:array_diagonal_two) { [
    [' ',' ',' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ',' ',' '],
    ['x','o','o','o','x','x','x'],
    ['x','o','o','o','x','x','o'],
    ['o','o','x','o','x','o','x']
  ] }

  describe "#initialize" do
    it "creates an empty 2D array" do
      expect(board.grid).to eq(array_empty)
    end
  end

  describe "#put_coin" do
    it "returns :invalid" do
      expect(board.put_coin('z', 'x')).to eq(:invalid)
    end
    it "returns :not_available" do
      board.grid = array_col_not_available
      expect(board.put_coin('a', 'x')).to eq(:not_available)
    end
    it "returns :none" do
      board.grid = array_draw
      expect(board.put_coin('g', 'o')).to eq(:none)
    end
    it "returns :draw" do
      board.grid = array_draw
      board.empty_spaces = 1
      expect(board.put_coin('g', 'o')).to eq(:draw)
    end
    it "returns :horizontal" do
      board.grid = array_horizontal
      expect(board.put_coin('b', 'o')).to eq(:horizontal)
    end
    it "returns :vertical" do
      board.grid = array_vertical
      expect(board.put_coin('a', 'x')).to eq(:vertical)
    end
    it "returns :diagonal" do
      board.grid = array_diagonal_one
      expect(board.put_coin('e', 'o')).to eq(:diagonal)
    end
    it "returns :diagonal" do
      board.grid = array_diagonal_two
      expect(board.put_coin('d', 'x')).to eq(:diagonal)
    end
  end
end
