require 'negamax'
require 'board'

RSpec.describe Negamax do
  it "returns maximum value when board is won for mark" do
    board = Board.from_a(["X", "X", "X",
                          "O", "O", "",
                           "", "", ""])
    expect(Negamax.calculate(board, "X")).to eq Negamax::MAX_VALUE
  end

  it "returns negative of maximum value when board is lost for mark" do
    board = Board.from_a(["X", "X", "X",
                          "O", "O", "",
                           "", "", ""])
    expect(Negamax.calculate(board, "O")).to eq -Negamax::MAX_VALUE
  end

  it "returns zero when board is drawn" do
    board = Board.from_a(["X", "X", "O",
                          "O", "X", "X",
                          "X", "O", "O"])
    expect(Negamax.calculate(board, "X")).to eq 0
    expect(Negamax.calculate(board, "O")).to eq 0 
  end
end
